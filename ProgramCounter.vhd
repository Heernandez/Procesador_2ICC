-- Create Date:    10:41:54 04/14/2018 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ProgramCounter is
    Port ( din : in  STD_LOGIC_VECTOR (31 downto 0) ;
					 dout : out  STD_LOGIC_VECTOR (31 downto 0);
					 rst : in  STD_LOGIC;
					 clk : in  STD_LOGIC);
end ProgramCounter;

architecture pc_arq of ProgramCounter is	
	
begin

		process (clk,rst) 
				begin  
						if (rst = '1') then
								dout <= (others => '0');
						else
								if(rising_edge(clk)) then
									dout <= din;
								end if;
						end if;
		
			end process;

end pc_arq;
