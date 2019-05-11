library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Project_Package.ALL;


entity MainModule is
    Port ( START : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           RegFileOut1 : out  STD_LOGIC_VECTOR(31 downto 0);
           RegFileOut2 : out  STD_LOGIC_VECTOR(31 downto 0);
           ALUOut : out  STD_LOGIC_VECTOR(31 downto 0);
           PCOut : out  STD_LOGIC_VECTOR(31 downto 0);
           DataMemOut : out  STD_LOGIC_VECTOR(31 downto 0));
end MainModule;

architecture Behavioral of MainModule is
signal cflag: std_logic;
signal zflag: std_logic;
signal oflag: std_logic;
signal cflagaddalu: std_logic;
signal zflagaddalu: std_logic;
signal oflagaddalu: std_logic;
 --variable pc :
signal tempPCOUT: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal InstructionCounter : std_logic_vector(31 downto 0);
signal PCAdderOut : std_logic_vector(31 downto 0);--instruction address +4
signal InstMemOut : std_logic_vector(31 downto 0);--output of Instruction Memory
signal PcAddress:std_logic_vector(31 downto 0);
 ---control unit var
signal CURegDst : STD_LOGIC;
signal CUjump:std_logic;
signal CUbneq:std_logic;
signal CUALUSrc :  STD_LOGIC;
signal CUMemtoReg : STD_LOGIC;
signal CURegWrite : STD_LOGIC;
signal CUMemRead : STD_LOGIC;
signal CUMemWrite : STD_LOGIC;
signal CUBranch : STD_LOGIC;
signal CUALUOp1 : STD_LOGIC;
signal CUALUOp0 : STD_LOGIC;
 ------------------
signal MUXRegDstout : STD_LOGIC_VECTOR (4 downto 0);--output of Mux whose selector id RegDst
 ---Output of Register File
signal RFdata1 : STD_LOGIC_VECTOR (31 downto 0);
signal RFdata2 :STD_LOGIC_VECTOR (31 downto 0);
 ------------------
signal DMMuxOut:STD_LOGIC_VECTOR (31 downto 0);
signal SignOut : STD_LOGIC_VECTOR (31 downto 0);--output of sign Extension
signal AluControlOut :STD_LOGIC_VECTOR(3 downto 0);--output of Alu control
signal ReadMuxOut : STD_LOGIC_VECTOR (31 downto 0);
 ---ALU variables
signal cflagALU: std_logic;
signal zflagALU: std_logic;
signal oflagALU: std_logic;
signal AluResult: STD_LOGIC_VECTOR(31 downto 0);
signal carryin:std_logic;
 ---------------------
signal datamemOut_signal:STD_LOGIC_VECTOR (31 downto 0);--output of Data Memory
signal ShiftLeftRes :STD_LOGIC_VECTOR (31 downto 0);
signal ALUDSTOUT:STD_LOGIC_VECTOR (31 downto 0);
signal MuxSelec:std_logic;
signal BranchMuxOut:std_logic_vector(31 downto 0);

signal notzero:std_logic;
signal MuxSelec2:std_logic;
signal OrResult: std_logic;
signal notStart:std_logic;
signal ALUControlOPcode:std_logic_vector(1 downto 0);
signal InstructionShift: std_logic_vector(31 downto 0);

  begin
  notStart <= not(START);
  genric:reg GENERIC MAP (32) PORT MAP (PcAddress,CLK,START,'0','0',tempPCOUT);
  InstructionCounter <= "00000000000000000000000000000100";
  
  ALU32 : ALU PORT MAP(tempPCOUT,InstructionCounter ,"0010",'0',PCAdderOut,cflag,zflag,oflag);
  
  Instmem : INSTRMEMORY PORT MAP(START,InstMemOut,tempPCOUT,CLK);
  
  CU :ControlUnit PORT MAP(InstMemOut(31 downto 26),CURegDst,CUjump,CUbneq,CUBranch,CUALUSrc,CUMemtoReg,CURegWrite,CUMemRead,CUMemWrite,CUALUOp1,CUALUOp0);
  
  mux2 :MUXRegDst PORT MAP(InstMemOut(20 downto 16),InstMemOut(15 downto 11),CURegDst,MUXRegDstout);
  
  RegFile : RegisterFile PORT MAP(InstMemOut(25 downto 21),InstMemOut(20 downto 16),MUXRegDstout,CURegWrite,CLK,DMMuxOut,RFdata1,RFdata2);
  
  SignExtend : sign_extension PORT MAP(InstMemOut(15 downto 0),SignOut);
  
  ReadMux1: ReadMux PORT MAP(RFdata2,SignOut,CUALUSrc,ReadMuxOut);
  
  ALUControlOPcode(0)<=CUALUOp0;
  ALUControlOPcode(1)<=CUALUOp1;
  
  My_AluControl: ALUControl PORT MAP(InstMemOut(5 downto 0),ALUControlOPcode,AluControlOut);
  
  ALUunit : ALU PORT MAP(RFdata1,ReadMuxOut,AluControlOut,AluControlOut(2),AluResult,cflagALU,zflagALU,oflagALU);

  
  DataMem: DATAMEMORY PORT MAP(notStart,RFdata2,datamemOut_signal,CUMemRead,CUMemWrite,AluResult,CLK);
 
  
  ReadMux2: ReadMux PORT MAP (AluResult,datamemOut_signal,CUMemtoReg,DMMuxOut);--DMMuxOut rayha ll register file tany 
  
  ShiftLeftRes<= SignOut(29 downto 0) & "00";
  
  ALU32add : ALU PORT MAP(PCAdderOut,ShiftLeftRes,"0010",'0',ALUDSTOUT,cflagaddalu,zflagaddalu,oflagaddalu);
 
  MuxSelec <= CUBranch and zflagALU;
  
  notzero <= not(zflagALU);
  MuxSelec2 <= CUbneq and notzero ;--msh f el rsma
  OrResult <= MuxSelec or MuxSelec2 ;
  
 
  ReadMux3: ReadMux PORT MAP (PCAdderOut,ALUDSTOUT,OrResult,BranchMuxOut);
  
  InstructionShift <= PCAdderOut(31 downto 28) & InstMemOut(25 downto 0) & "00"  ;
	
  ReadMux4: ReadMux PORT MAP (BranchMuxOut, InstructionShift, CUjump, PcAddress);
  
PCOut <=tempPCOUT ;
ALUOut <= AluResult;
RegFileOut1 <= RFdata1;
RegFileOut2 <= RFdata2;
DataMemOut <= datamemOut_signal;
end Behavioral;

