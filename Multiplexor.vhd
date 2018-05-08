----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity Multiplexor is
    Port ( CRS2 : in  STD_LOGIC_VECTOR (31 downto 0);
					  SEU : in  STD_LOGIC_VECTOR (31 downto 0);
					  INM : in  STD_LOGIC;
					  OUTM : out  STD_LOGIC_VECTOR (31 downto 0));
end Multiplexor;

architecture Behavioral of Multiplexor is

begin
		
		process (CRS2, SEU, INM)
					begin
					if(INM =  '1' ) then
							OUTM <= SEU;
					else
							OUTM <= CRS2;
					end if;
		end process;	

end Behavioral;

