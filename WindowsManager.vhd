-- Create Date:    15:19:57 05/07/2018 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.std_logic_arith.all;

entity WindowsManager is
    Port ( 		  RS1 : in  STD_LOGIC_VECTOR (4 downto 0);
							  RS2 : in  STD_LOGIC_VECTOR (4 downto 0);
							  RD : in  STD_LOGIC_VECTOR (4 downto 0);
							  CWP : in  STD_LOGIC;
							  OP : in  STD_LOGIC_VECTOR (1 downto 0);
							  OP3 : in  STD_LOGIC_VECTOR (5 downto 0);							  
							  nRS1 : out  STD_LOGIC_VECTOR (5 downto 0);
							  nRS2 : out  STD_LOGIC_VECTOR (5 downto 0);
							  nRD : out  STD_LOGIC_VECTOR (5 downto 0);
							  nCWP : out  STD_LOGIC);
end WindowsManager;

architecture Behavioral of WindowsManager is

begin

		process(RS1, RS2, RD, CWP, OP,OP3)
				begin
						--Ventaneo
						if OP = "10" then
								if (OP3 = "111100") and (CWP = '1') then -- SAVE
										nCWP <= '0' ;	--Paso hacia atrás del puntero de ventana
								elsif (OP3 = "111101") and (CWP = '0') then -- RESTORE
										nCWP <= '1';	--Paso hacia adelante del puntero de ventana
								else
										nCWP <= CWP;
								end if;
						end if;
						--REGISTRO FUENTE 1
						if ( RS1>= "11000" and RS1 <= "11111") then				--Si es un registro de entrada (r[24] - r[31])
									nRS1 <=conv_std_logic_vector(conv_integer(RS1) - conv_integer(CWP)* 16, 6) ;
						elsif (RS1>= "10000" and RS1 <= "10111") then		--Si es un registro de local (r[16] - r[23])
									nRS1 <= conv_std_logic_vector(conv_integer(RS1) + conv_integer(CWP) * 16,6) ;
						elsif ( RS1>= "01000" and RS1 <= "01111") then		--Si es un registro de salida (r[8] - r[15])
									nRS1 <= conv_std_logic_vector(conv_integer(RS1) + conv_integer(CWP) * 16,6) ;
--						elsif (RS1 >= "00000" and RS1 <= "00111") then		--Si es un registro global (r[0] - r[7]) No Funciona por ahora
--									nRS1 <= conv_std_logic_vector(conv_integer(RS1));
						else 
								nRS2(4 downto 0) <=  RS2;
								nRS2 (5) <= '0';
						end if;
						--REGISTRO FUENTE 2
						if ( RS2>= "11000" and RS2 <= "11111") then				--Entrada
									nRS2 <=conv_std_logic_vector(conv_integer(RS2) - conv_integer(CWP)* 16, 6) ;
						elsif (RS2>= "10000" and RS2 <= "10111") then		--Local
									nRS2 <= conv_std_logic_vector(conv_integer(RS2) + conv_integer(CWP) * 16,6) ;
						elsif ( RS2>= "01000" and RS2 <= "01111") then		--Salida
									nRS2 <= conv_std_logic_vector(conv_integer(RS2) + conv_integer(CWP) * 16,6) ;
--						elsif (RS2 >= "00000" and RS2 <= "00111") then		--Global    No Funciona por ahora
--									nRS2 <= conv_std_logic_vector(conv_integer(RS2));		
						else 
								nRS2(4 downto 0) <=  RS2;
								nRS2 (5) <= '0';
						end if;
						--REGISTRO DESTINO
						if ( RD>= "11000" and RD <= "11111") then					--Entrada
									nRD <=conv_std_logic_vector(conv_integer(RD) - conv_integer(CWP)* 16, 6) ;
						elsif (RD>= "10000" and RD <= "10111") then			--Local
									nRD <= conv_std_logic_vector(conv_integer(RD) + conv_integer(CWP) * 16,6) ;
						elsif ( RD>= "01000" and RD <= "01111") then			--Salida
									nRD <= conv_std_logic_vector(conv_integer(RD) + conv_integer(CWP) * 16,6) ;
--						elsif (RD >= "00000" and RD<= "00111") then			--Global No Funciona por ahora
--									nRD <= conv_std_logic_vector(conv_integer(RD));		
						else 
								nRD(4 downto 0) <=  RD;
								nRD (5) <= '0';
						end if;
		end process;
end Behavioral;

