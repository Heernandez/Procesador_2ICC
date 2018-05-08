LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY UC_tb IS
END UC_tb;
 
ARCHITECTURE behavior OF UC_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT UC
    PORT(
         Op : IN  std_logic_vector(1 downto 0);
         Op3 : IN  std_logic_vector(5 downto 0);
         AluOp : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Op : std_logic_vector(1 downto 0) := (others => '0');
   signal Op3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal AluOp : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- apprOpriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: UC PORT MAP (
          Op => Op,
          Op3 => Op3,
          AluOp => AluOp
        );

   
   -- Stimulus process
   stim_proc: process
   begin		
				
		Op <= "01";
		Op3 <= "000000";
      wait for 20 ns;	
		
		Op <= "01";
		Op3 <= "000001";
      wait for 20 ns;	
		
		Op <= "01";
		Op3 <= "000010";
      wait for 20 ns;	
		
		Op <= "01";
		Op3 <= "000011";
      wait for 20 ns;	
		
      wait;
   end process;

END;
