library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Direccionamiento is
    Port ( 	rst : in  STD_LOGIC;
						clk : in  STD_LOGIC;
						outPC : out  STD_LOGIC_VECTOR (5 downto 0));
end Direccionamiento;

architecture Behavioral of Direccionamiento is

component Sumador32bits is
    Port ( dinA : in  STD_LOGIC_VECTOR (31 downto 0);
					  dinB : in  STD_LOGIC_VECTOR (31 downto 0);
					  doutC : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component ProgramCounter is
    Port ( din : in  STD_LOGIC_VECTOR (31 downto 0) ;
					 dout : out  STD_LOGIC_VECTOR (31 downto 0);
					 rst : in  STD_LOGIC;
					 clk : in  STD_LOGIC);
end component;

signal  rsumador, rpc, rnpc  : STD_LOGIC_VECTOR(31 downto 0);

begin

outPC <= rpc(5 downto 0);

inst_sum :Sumador32bits PORT MAP(
				dinA => X"00000001",
				dinB => rpc,
				doutC => rsumador
);

inst_npc : ProgramCounter PORT MAP(
				din => rsumador,
				dout => rnpc,
				rst => rst,
				clk => clk
);

inst_pc : ProgramCounter PORT MAP(
				din => rnpc,
				dout => rpc,
				rst => rst,
				clk => clk
);


end Behavioral;

