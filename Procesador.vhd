library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Procesador is
    Port ( clk : in  STD_LOGIC;
					  rst : in  STD_LOGIC;
					  ALURESULT : out  STD_LOGIC_VECTOR (31 downto 0));
end Procesador;

architecture Behavioral of Procesador is

		component Direccionamiento is
		Port ( 	rst : in  STD_LOGIC;
							clk : in  STD_LOGIC;
							outPC : out  STD_LOGIC_VECTOR (5 downto 0));
		end component;
		
		component UC  is
							Port (Op : in  STD_LOGIC_VECTOR (1 downto 0);
							Op3 : in  STD_LOGIC_VECTOR (5 downto 0);
							AluOp : out  STD_LOGIC_VECTOR (5 downto 0));
		end component;
		
		component UnidadExtensionSenial  is
					Port ( imm13 : in  STD_LOGIC_VECTOR (12 downto 0);
					outseu : out  STD_LOGIC_VECTOR (31 downto 0));
		end component;
		
		component RegisterFile  is
					Port ( 	  rst : in  STD_LOGIC;
						  rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
						  rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
						  rd : in  STD_LOGIC_VECTOR (4 downto 0);
						  dwr : in  STD_LOGIC_VECTOR (31 downto 0);
						  crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
						  crs2 : out  STD_LOGIC_VECTOR (31 downto 0));
		end component;
		
		component  Multiplexor  is
					 Port ( CRS2 : in  STD_LOGIC_VECTOR (31 downto 0);
					  SEU : in  STD_LOGIC_VECTOR (31 downto 0);
					  INM : in  STD_LOGIC;
					  OUTM : out  STD_LOGIC_VECTOR (31 downto 0));
		end component;
		
		component InstructionMemory  is
					 Port ( address: in  STD_LOGIC_VECTOR (5 downto 0);
					  reset : in  STD_LOGIC;
					  outInstruction: out  STD_LOGIC_VECTOR (31 downto 0));
		end component;
		
		component  Alu  is
					 Port ( 	  A : in  STD_LOGIC_VECTOR (31 downto 0);
						  B : in  STD_LOGIC_VECTOR (31 downto 0);
						  AluOp : in  STD_LOGIC_VECTOR (5 downto 0);
						  AluResult : out  STD_LOGIC_VECTOR (31 downto 0));
		end component;
		
		signal out_im, resultAlu, CRS1, CRS2, out_seu, out_mux : STD_LOGIC_VECTOR(31 downto 0);
		signal out_uc : STD_LOGIC_VECTOR(5 downto 0);
		signal IMIN : STD_LOGIC_VECTOR(5 downto 0);

begin
		
		Inst_DI : Direccionamiento Port Map (
						rst => rst,
						clk => clk,
						outPC => IMIN
			);
		
		Inst_IM : InstructionMemory  port map(
					
						address => IMIN,
						outInstruction => out_im,
						reset => rst				
		);
		
		Inst_UC : UC  port map(
					
						Op => out_im(31 downto 30) ,
						Op3 => out_im(24 downto 19),
						AluOp => out_uc 				
		);
		
		Inst_RF : RegisterFile  port map(
					
					rst => rst,
					rs1 => out_im(18 downto 14),
					rs2 => out_im(4 downto 0),
					rd => out_im(29 downto 25),
					dwr => resultAlu,
					crs1 => CRS1,
					crs2 => CRS2		
		);
		
		Inst_SEU : UnidadExtensionSenial  port map(
					
					imm13 => out_im(12 downto 0),
					outseu	=> out_seu
		);
		
		Inst_MUX : Multiplexor  port map(
					
					CRS2 => CRS2,
					 SEU => out_seu,
					 INM => out_im(13),
					 OUTM => out_mux
		);
		
		Inst_ALU : Alu port map(
					
				  A  => CRS1,
				  B => out_mux,
				  AluOp => out_uc,
				  AluResult => resultAlu
		);
		
		ALURESULT <= resultAlu;

end Behavioral;

