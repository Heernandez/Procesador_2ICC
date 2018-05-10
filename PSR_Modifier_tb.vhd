--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:58:25 05/09/2018
-- Design Name:   
-- Module Name:   /home/andres/Procesador 2/Procesador_ICC/PSR_Modifier_tb.vhd
-- Project Name:  ProcesadorMonociclo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PSR_Modifier
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
 
ENTITY PSR_Modifier_tb IS
END PSR_Modifier_tb;
 
ARCHITECTURE behavior OF PSR_Modifier_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PSR_Modifier
    PORT(
         AluOp : IN  std_logic_vector(5 downto 0);
         AluResult : IN  std_logic_vector(31 downto 0);
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         NZVC : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal AluOp : std_logic_vector(5 downto 0) := (others => '0');
   signal AluResult : std_logic_vector(31 downto 0) := (others => '0');
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal NZVC : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSR_Modifier PORT MAP (
          AluOp => AluOp,
          AluResult => AluResult,
          A => A,
          B => B,
          NZVC => NZVC
        );

   -- Stimulus process
   stim_proc: process
   begin		
      
		A <= "01111111111111111111111111111111";
		B <= "01111111111111111111111111111111";
		AluOp <= "010000";
		AluResult <="11111111111111111111111111111110";
	   wait for 10 ns;	
	   A <= "00000000000000000000000000000000";
		B <= "00000000000000000000000000000000";
		AluOp <= "010010";
		AluResult <="00000000000000000000000000000000";
	   wait for 10 ns;
		
		A <= "10000000000000000000000000000000";
		B <= "10000000000000000000000000000000";
		AluOp <= "010001";
		AluResult <="10000000000000000000000000000000";
	  
      -- hold reset state for 100 ns.
      wait for 100 ns;
		
   end process;
END;
