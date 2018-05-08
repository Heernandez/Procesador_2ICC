library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Alu is
    Port ( 	  A : in  STD_LOGIC_VECTOR (31 downto 0);
						  B : in  STD_LOGIC_VECTOR (31 downto 0);
						  AluOp : in  STD_LOGIC_VECTOR (5 downto 0);
						  C : in  STD_LOGIC;
						  AluResult : out  STD_LOGIC_VECTOR (31 downto 0));
end Alu;

architecture Behavioral of Alu is

			signal carry : std_logic_vector(31 downto 0) := (others => '0');	-- Señal auxiliar para complementar los siguientes 31 bits  de carry con (0)

begin
			
			carry(0) <= C;			
			process(A ,B , AluOp)
			begin 
							case (AluOp) is							
									when "000000" | "010000" => AluResult <= STD_LOGIC_VECTOR(SIGNED (A) + SIGNED (B));			--add o addcc
									when "000100" | "010100" => AluResult <= STD_LOGIC_VECTOR(SIGNED (A) -  SIGNED (B));			--sub o subcc
									when "000010" | "010010" => AluResult <= A or B;																														--or o orcc
									when "000110" | "010110"=> AluResult <= (A or (not B));																										--nor o norcc
									when "000011" | "010011"=> AluResult <= A xor B;																													--xor o xorcc
									when "000111" | "010111"=> AluResult <= A xnor B;																												--xnor o xnorcc
									when "000001" | "010001"=> AluResult <= A and B;																													--and o andcc
									when "000101" | "010101"=> AluResult <= (A and (not B));																								--nand o nandcc
									when "001000" | "011000"=> AluResult <= STD_LOGIC_VECTOR(SIGNED (A) + SIGNED (B) + signed(carry));		--addx o addxcc
									when "001100" | "011100"=> AluResult <= STD_LOGIC_VECTOR(SIGNED (A)  - SIGNED (B)  - signed(carry));		--subx o subxcc
									when others => AluResult <= (others => '0');
							
							end case;
		end process;

end Behavioral;

