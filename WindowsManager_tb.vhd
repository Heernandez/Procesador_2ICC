--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:12:07 05/07/2018
-- Design Name:   
-- Module Name:   /home/andres/Procesador 2/Procesador_ICC/WindowsManager_tb.vhd
-- Project Name:  ProcesadorMonociclo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: WindowsManager
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY WindowsManager_tb IS
END WindowsManager_tb;
 
ARCHITECTURE behavior OF WindowsManager_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT WindowsManager
    PORT(
         RS1 : IN  std_logic_vector(4 downto 0);
         RS2 : IN  std_logic_vector(4 downto 0);
         RD : IN  std_logic_vector(4 downto 0);
         CWP : IN  std_logic;
         OP : IN  std_logic_vector(1 downto 0);
         OP3 : IN  std_logic_vector(5 downto 0);
         nRS1 : OUT  std_logic_vector(5 downto 0);
         nRS2 : OUT  std_logic_vector(5 downto 0);
         nRD : OUT  std_logic_vector(5 downto 0);
         nCWP : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal RS1 : std_logic_vector(4 downto 0) := (others => '0');
   signal RS2 : std_logic_vector(4 downto 0) := (others => '0');
   signal RD : std_logic_vector(4 downto 0) := (others => '0');
   signal CWP : std_logic := '0';
   signal OP : std_logic_vector(1 downto 0) := (others => '0');
   signal OP3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal nRS1 : std_logic_vector(5 downto 0);
   signal nRS2 : std_logic_vector(5 downto 0);
   signal nRD : std_logic_vector(5 downto 0);
   signal nCWP : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: WindowsManager PORT MAP (
          RS1 => RS1,
          RS2 => RS2,
          RD => RD,
          CWP => CWP,
          OP => OP,
          OP3 => OP3,
          nRS1 => nRS1,
          nRS2 => nRS2,
          nRD => nRD,
          nCWP => nCWP
        );

     -- Stimulus process
   stim_proc: process
   begin		
      
					CWP <= '0';
					RS1 <= "11000";
					RS2 <= "01111";
					RD <= "10101";
					OP <= "10";
					OP3 <= "111100";							
					wait for 40 ns;
					
					CWP <= '1';
					RS1 <= "00000";
					RS2 <= "00001";
					RD <= "10000";
					OP <= "10";
					OP3 <= "000000";
					wait for 40 ns;
		
      wait;
   end process;
END;
