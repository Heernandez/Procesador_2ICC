LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ProgramCounter_tb IS
END ProgramCounter_tb;
 
ARCHITECTURE behavior OF ProgramCounter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ProgramCounter
    PORT(
         din : IN  std_logic_vector(31 downto 0);
         dout : OUT  std_logic_vector(31 downto 0);
         rst : IN  std_logic;
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal din : std_logic_vector(31 downto 0) := (others => '0');
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal dout : std_logic_vector(31 downto 0);
	
	-- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ProgramCounter PORT MAP (
          din => din,
          dout => dout,
          rst => rst,
          clk => clk
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
					din <= "00000000000000000000000000000011";
					rst <= '1';
					wait for 10 ns;

					din <= "00000000000000000000000000001110";
					rst <= '0';
					wait for 10 ns;
					
					din<= "00000000000000000000000000000111";
					rst <= '1';
					wait for 10 ns;
					
					din <= "00000000000000000000000000000111";
					rst <= '1';
					wait for 10 ns;
					
		 wait;
   end process;
END;
