library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RegisterFile is
    Port ( 	  rst : in  STD_LOGIC;
						  rs1 : in  STD_LOGIC_VECTOR (5 downto 0);
						  rs2 : in  STD_LOGIC_VECTOR (5 downto 0);
						  rd : in  STD_LOGIC_VECTOR (5 downto 0);
						  dwr : in  STD_LOGIC_VECTOR (31 downto 0);
						  crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
						  crs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end RegisterFile;

architecture Behavior of RegisterFile is

	type rom_type is array (0 to 39) of std_logic_vector (31 downto 0);	
	
	signal RF : rom_type := (others =>( x"00000000"));
	
begin
--reset,address, instructions)
	process(rst,rs1, rs2, rd,  dwr)--clk)
	begin
		--if(rising_edge(clk))then
				if(rst = '1')then
					RF<= (others =>x"00000000");
					crs1 <= (others=>'0');
					crs2 <= (others=>'0');
				else
					crs1 <= RF(conv_integer(rs1));
					crs2 <= RF(conv_integer(rs2));
					if (rd/="000000") then
						RF(conv_integer(rd))<=dwr;
				end if;
		end if;
	end process;
end Behavior;