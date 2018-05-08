LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Direccionamiento_tb IS
END Direccionamiento_tb;
 
ARCHITECTURE behavior OF Direccionamiento_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Direccionamiento
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         outPC : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal outPC : std_logic_vector(5 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Direccionamiento PORT MAP (
          rst => rst,
          clk => clk,
          outPC => outPC
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
      wait for 20 ns;	
      rst <= '0';

      -- insert stimulus here 

      wait;
   end process;

END;
