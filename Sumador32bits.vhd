library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Sumador32bits is
    Port ( dinA : in  STD_LOGIC_VECTOR (31 downto 0);
					  dinB : in  STD_LOGIC_VECTOR (31 downto 0);
					  doutC : out  STD_LOGIC_VECTOR (31 downto 0));
end Sumador32bits;

architecture Behavioral of Sumador32bits is

begin

		doutC  <=  STD_LOGIC_VECTOR(UNSIGNED(dinA) + UNSIGNED(dinB));
		
end Behavioral;

