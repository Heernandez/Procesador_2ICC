LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY Sumador32bits_tb IS
END Sumador32bits_tb;
 
ARCHITECTURE behavior OF Sumador32bits_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Sumador32bits
    PORT(
         dinA : IN  std_logic_vector(31 downto 0);
         dinB : IN  std_logic_vector(31 downto 0);
         doutC : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal dinA : std_logic_vector(31 downto 0) := (others => '0');
   signal dinB : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal doutC : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Sumador32bits PORT MAP (
          dinA => dinA,
          dinB => dinB,
          doutC => doutC
        );

      -- Stimulus process
   stim_proc: process
		begin		
		
				dinA <= "00000000000000000000000000000000";
				dinB <= "00000000000000000000000000000000";				
				wait for 100 ns;	
				
				dinA <= "00000000000000000000000000000001";
				dinB <= "00000000000000000000000000000001";
				wait for 100 ns;
				
				dinA <= "00000000000000000000000000000010";
				dinB <= "00000000000000000000000000000010";
				wait for 100 ns;
				
				dinA <= "00000000000000000000000000000111";
				dinB <= "00000000000000000000000000000111";
				wait for 100 ns;	
			
      wait;
   end process;
END;
