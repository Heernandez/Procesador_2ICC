LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY Multiplexor_tb IS
END Multiplexor_tb;
 
ARCHITECTURE behavior OF Multiplexor_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Multiplexor
    PORT(
         CRS2 : IN  std_logic_vector(31 downto 0);
         SEU : IN  std_logic_vector(31 downto 0);
         INM : IN  std_logic;
         OUTM : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CRS2 : std_logic_vector(31 downto 0) := (others => '0');
   signal SEU : std_logic_vector(31 downto 0) := (others => '0');
   signal INM : std_logic := '0';

 	--Outputs
   signal OUTM : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Multiplexor PORT MAP (
          CRS2 => CRS2,
          SEU => SEU,
          INM => INM,
          OUTM => OUTM
        );

   -- Stimulus process
   stim_proc: process
   begin		
      
			INM<='1';
			CRS2<=(others => '1');
			SEU<=(others => '0');
			wait for 100 ns;
			INM<='0';

      wait;
   end process;

END;
