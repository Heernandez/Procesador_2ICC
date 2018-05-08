-- Create Date:    17:22:53 05/02/2018 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PSR is
    Port (	  
							clk: in STD_LOGIC;
							rst: in STD_LOGIC;
							nCWP : in  STD_LOGIC;
							NZVC : in  STD_LOGIC_VECTOR (3 downto 0);
							CWP : out  STD_LOGIC;
							C : out  STD_LOGIC	);
end PSR;

architecture Behavioral of PSR is

	signal auxPSR: STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

begin

		process (clk, rst, nCWP, NZVC)
				begin
							if rst = '1' then
									CWP <= '0';
									C <= '0';
							else 
											if  rising_edge(clk) then 
														auxPSR(23 downto 20) <= NZVC;
														auxPSR(0) <= nCWP;														
														C <= auxPSR(20);
														CWP <= nCWP;
											end if;
							end if;
		end process;
end Behavioral;

