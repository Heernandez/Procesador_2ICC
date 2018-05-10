----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:48:15 05/09/2018 
-- Design Name: 
-- Module Name:    PSR_Modifier - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PSR_Modifier is
    Port ( 	AluOp : in  STD_LOGIC_VECTOR (5 downto 0);
						AluResult : in  STD_LOGIC_VECTOR (31 downto 0);
						A : in  STD_LOGIC_VECTOR (31 downto 0);
						B : in  STD_LOGIC_VECTOR (31 downto 0);
						NZVC : out  STD_LOGIC_VECTOR (3 downto 0));
		end PSR_Modifier;
	
architecture Behavioral of PSR_Modifier is

begin
process(AluOp, AluResult, A, B)
			begin
				if (AluOp = "010000" or  AluOp = "011000")then --adds
				NZVC(3) <= (AluResult(31));
				if (AluResult = x"00000000") then 
					NZVC(2) <= '1'; 
				else NZVC(2) <=  '0'; 
				end if;
				NZVC(1) <= (A(31) and B(31) and (not AluResult(31))) or ((not A(31)) and (not B(31)) and AluResult(31));
				NZVC(0) <= (A(31) and B(31)) or  ((not AluResult(31)) and (A(31) or B(31)));
				
				end if;
		
				if (AluOp = "010100" or AluOp = "011100") then -- subs
				NZVC(3) <= AluResult(31);
				if (AluResult = x"00000000") then 
					NZVC(2) <= '1'; 
				else NZVC(2) <=  '0'; 
				end if;
				NZVC(1) <= (A(31) and (not B(31) and (not AluResult(31)))) or ((not A(31)) and B(31) and AluResult(31));
				NZVC(0) <= ((not A(31)) and B(31)) or (AluResult(31) and ((not A(31)) or B(31)));
				end if ;
				
				if (AluOp = "010001" or  AluOp = "010101" or AluOp = "010010" or AluOp = "010110" or AluOp = "010011" or AluOp = "010111")then -- logicas
					NZVC(3) <= AluResult(31);
				if (AluResult = x"00000000") then 
						NZVC(2) <= '1'; 
				else NZVC(2) <=  '0'; 
				end if;
				NZVC(1) <= '0'; 
				NZVC(0) <= '0'; 
				end if;

		end process;
end Behavioral;

