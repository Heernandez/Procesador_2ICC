-- Create Date:    13:11:34 04/14/2018 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UnidadExtensionSenial is
    Port ( imm13 : in  STD_LOGIC_VECTOR (12 downto 0);
					outseu : out  STD_LOGIC_VECTOR (31 downto 0));
end UnidadExtensionSenial;

architecture Behavioral of UnidadExtensionSenial is

begin

		process( imm13)
			begin
				
				outseu(12 downto 0) <= imm13;
				if(imm13(12) = '0') then					
					outseu (31 downto 13) <= (others => '0' );
				else
					outseu (31 downto 13) <= (others => '1' );
				
				end if;
		end process;

end Behavioral;

