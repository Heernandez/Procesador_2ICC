LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Alu_tb IS
END Alu_tb;
 
ARCHITECTURE behavior OF Alu_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Alu
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         AluOp : IN  std_logic_vector(5 downto 0);
			C : IN  std_logic;
         AluResult : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal AluOp : std_logic_vector(5 downto 0) := (others => '0');
	signal C : std_logic;

 	--Outputs
   signal AluResult : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Alu PORT MAP (
          A => A,
          B => B,
          AluOp => AluOp,
			 C => C,
          AluResult => AluResult
        );

   -- Stimulus process
   stim_proc: process
   begin		
      
				A<=X"0000000A";
				B<=X"0000000A";
				AluOp<="000000";
				wait for 20 ns;
				
				AluOp<="000001";
				wait for 20 ns;
				
				AluOp<="000010";
				wait for 20 ns;
				
				AluOp<="000011";
				wait for 20 ns;
				
				AluOp<="000100";
				wait for 20 ns;
				
				AluOp<="000101";
				wait for 20 ns;
				
				AluOp<="000110";
				wait for 20 ns;
				
				AluOp<="000111";
				wait for 20 ns;
						
      wait;
   end process;

END;
