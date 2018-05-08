library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UC is
    Port ( 	  Op : in  STD_LOGIC_VECTOR (1 downto 0);
						  Op3 : in  STD_LOGIC_VECTOR (5 downto 0);
						  AluOp : out  STD_LOGIC_VECTOR (5 downto 0));
end UC;

architecture Behavioral of UC is

begin
			process(Op, Op3)
					begin
									case (Op) is
										when "10" =>
												case (Op3) is
									
														when "000000" => AluOp <= Op3;
														when "000001" => AluOp <= Op3;
														when "000100" => AluOp <= Op3;
														when "000010" => AluOp <= Op3;
														when "000011" => AluOp <= Op3;
														when "000111" => AluOp <= Op3;
														when "000101" => AluOp <= Op3;
														when "000110" => AluOp <= Op3;														
														when others => AluOp <= Op3;
						
												end case;
										when others => AluOp <= "111111";
									end case;
			end process;
end Behavioral;

