LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY UnidadExtensionSigno_tb IS
END UnidadExtensionSigno_tb;
 
ARCHITECTURE behavior OF UnidadExtensionSigno_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT UnidadExtensionSenial
    PORT(
         imm13 : IN  std_logic_vector(12 downto 0);
         outseu : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal imm13 : std_logic_vector(12 downto 0) := (others => '0');

 	--Outputs
   signal outseu : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: UnidadExtensionSenial PORT MAP (
          imm13 => imm13,
          outseu => outseu
        );

   -- Stimulus process
   stim_proc: process
   begin	
	
			imm13 <= "0110100010110";
      	wait for 20 ns;
			
			imm13 <= "1110100010110";
      	wait for 20 ns;
			
      wait;
   end process;

END;
