-- Create Date:   17:31:21 05/02/2018
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY PSR_tb IS
END PSR_tb;
 
ARCHITECTURE behavior OF PSR_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PSR
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         nCWP : IN  std_logic;
         NZVC : IN  std_logic_vector(3 downto 0);
         CWP : OUT  std_logic;
         C : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal nCWP : std_logic := '0';
   signal NZVC : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal CWP : std_logic;
   signal C : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSR PORT MAP (
          clk => clk,
          rst => rst,
          nCWP => nCWP,
          NZVC => NZVC,
          CWP => CWP,
          C => C
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
					rst <= '1';			
					wait for 50 ns;	
					rst <= '0';
					NZVC <= "0111";
					nCWP <= '1';		
					wait for clk_period;		
					NZVC <= "0101";
					nCWP <= '0';

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
