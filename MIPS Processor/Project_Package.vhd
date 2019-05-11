library IEEE;
use IEEE.STD_LOGIC_1164.all;

package Project_Package is
-------------------------------------------------------------
--component REG1 is
--Generic(n:NATURAL :=4);
--PORT(
--I:IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
--CLK,LD,INC,CLR :IN STD_LOGIC;
--O:OUT STD_LOGIC_VECTOR(n-1 downto 0) );
--END component;
-------------------------------------------------------------
component Mux32 is
    Port ( I0 : in  STD_LOGIC_VECTOR (31 downto 0);
           I1 : in  STD_LOGIC_VECTOR (31 downto 0);
           I2 : in  STD_LOGIC_VECTOR (31 downto 0);
           I3 : in  STD_LOGIC_VECTOR (31 downto 0);
           I4 : in  STD_LOGIC_VECTOR (31 downto 0);
           I5 : in  STD_LOGIC_VECTOR (31 downto 0);
           I6 : in  STD_LOGIC_VECTOR (31 downto 0);
           I7 : in  STD_LOGIC_VECTOR (31 downto 0);
           I8 : in  STD_LOGIC_VECTOR (31 downto 0);
           I9 : in  STD_LOGIC_VECTOR (31 downto 0);
           I10 : in  STD_LOGIC_VECTOR (31 downto 0);
           I11 : in  STD_LOGIC_VECTOR (31 downto 0);
           I12 : in  STD_LOGIC_VECTOR (31 downto 0);
           I13 : in  STD_LOGIC_VECTOR (31 downto 0);
           I14 : in  STD_LOGIC_VECTOR (31 downto 0);
           I15 : in  STD_LOGIC_VECTOR (31 downto 0);
           I16 : in  STD_LOGIC_VECTOR (31 downto 0);
           I17 : in  STD_LOGIC_VECTOR (31 downto 0);
           I18 : in  STD_LOGIC_VECTOR (31 downto 0);
           I19 : in  STD_LOGIC_VECTOR (31 downto 0);
           I20 : in  STD_LOGIC_VECTOR (31 downto 0);
           I21 : in  STD_LOGIC_VECTOR (31 downto 0);
           I22 : in  STD_LOGIC_VECTOR (31 downto 0);
           I23 : in  STD_LOGIC_VECTOR (31 downto 0);
           I24 : in  STD_LOGIC_VECTOR (31 downto 0);
           I25 : in  STD_LOGIC_VECTOR (31 downto 0);
           I26 : in  STD_LOGIC_VECTOR (31 downto 0);
           I27 : in  STD_LOGIC_VECTOR (31 downto 0);
           I28 : in  STD_LOGIC_VECTOR (31 downto 0);
           I29 : in  STD_LOGIC_VECTOR (31 downto 0);
           I30 : in  STD_LOGIC_VECTOR (31 downto 0);
           I31 : in  STD_LOGIC_VECTOR (31 downto 0);
           Selector : in  STD_LOGIC_VECTOR (4 downto 0);
           Output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;
-------------------------------------------------------------
component Mux2 is
    Port ( I0 : in  STD_LOGIC;
           I1 : in  STD_LOGIC;
           Selector : in  STD_LOGIC;
           Output : out  STD_LOGIC);
end component;
-------------------------------------------------------------
component Mux4 is
    Port ( I0 : in  STD_LOGIC;
           I1 : in  STD_LOGIC;
           I2 : in  STD_LOGIC;
           I3 : in  STD_LOGIC;
           selector1 : in  STD_LOGIC_VECTOR (1 DOWNTO 0);
           selector2 : in  STD_LOGIC_VECTOR (1 DOWNTO 0);
           result : out  STD_LOGIC);
end component;
-------------------------------------------------------------
component MUXRegDst is
    Port ( Dst1 : in STD_LOGIC_VECTOR (4 downto 0);
           Dst2 : in STD_LOGIC_VECTOR (4 downto 0);
           Selc : in STD_LOGIC;
           DestOut : out STD_LOGIC_VECTOR (4 downto 0));
end component;
-------------------------------------------------------------
component ReadMux is
    Port ( Input1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Input2 : in  STD_LOGIC_VECTOR (31 downto 0);
           selc : in  STD_LOGIC;
           Output1 : out  STD_LOGIC_VECTOR (31 downto 0));
end component;
-------------------------------------------------------------

component Decoder is
    Port ( I : in  STD_LOGIC_VECTOR (4 downto 0);
           E : in  STD_LOGIC;
			  O : out  STD_LOGIC_VECTOR (31 downto 0));
end component;
-------------------------------------------------------------
component adder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
			  carryin : in STD_LOGIC;
           result : out  STD_LOGIC;
           carry : out  STD_LOGIC);
end component;

-------------------------------------------------------------

component OneBitAlu is
     Port ( data1 : in  STD_LOGIC;
           data2 : in  STD_LOGIC;
			  less: in STD_LOGIC;
           cin : in  STD_LOGIC;
           aluop : in  STD_LOGIC_VECTOR (1 DOWNTO 0);
			  aluop2 :in STD_LOGIC_VECTOR (1 DOWNTO 0);
           cout : out  STD_LOGIC;
           dataout : out  STD_LOGIC;
			  setRes:out STD_LOGIC);
end component;
-------------------------------------------------------------
component ALU is
    Port ( data1 : in  STD_LOGIC_VECTOR(31 downto 0);
           data2 : in  STD_LOGIC_VECTOR(31 downto 0);
           aluop : in  STD_LOGIC_VECTOR(3 downto 0);
           cin : in  STD_LOGIC;
           dataout : out  STD_LOGIC_VECTOR(31 downto 0);
           cflag : out  STD_LOGIC;
           zflag : out  STD_LOGIC;
           oflag : out  STD_LOGIC);
end component;
-------------------------------------------------------------
component DATAMEMORY is
 Generic(words : natural :=64;wordsize: natural :=32; addresssize: natural := 32);
  port ( LoadIt:   in STD_LOGIC;--notstart
  			INPUT     : in STD_LOGIC_VECTOR (wordsize-1 downto 0);--readdata2 rf
			OUTPUT    : out STD_LOGIC_VECTOR (wordsize-1 downto 0);
         MEM_READ : in STD_LOGIC;
			MEM_WRITE : in STD_LOGIC;
			ADDRESS   : in STD_LOGIC_VECTOR (addresssize-1 downto 0);--alu res
			CLK       : in STD_LOGIC
			);

end component;
-------------------------------------------------------------
component INSTRMEMORY is
	Generic(words : natural :=64;wordsize: natural :=32; addresssize: natural := 32);
  port(
    LoadIt: in Std_logic ;
	 DATA: out STD_LOGIC_VECTOR(wordsize-1 downto 0);
    ADDRESS: in STD_LOGIC_VECTOR(addresssize-1 downto 0);
    CLK: in STD_LOGIC
    );
end component;
-------------------------------------------------------------
component reg IS
GENERIC(n:NATURAL);
PORT (
I: IN  STD_LOGIC_VECTOR (n-1 DOWNTO 0);
	CLK, LOD, INC, CLR: IN STD_LOGIC;
	O: OUT  STD_LOGIC_VECTOR (n-1 DOWNTO 0));
END component;
-------------------------------------------------------------
component RegisterFile is
    Port ( read_sel1 : in  STD_LOGIC_VECTOR (4 downto 0);
           read_sel2 : in  STD_LOGIC_VECTOR (4 downto 0);
           write_sel : in  STD_LOGIC_VECTOR (4 downto 0);
           write_ena : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           write_data : in  STD_LOGIC_VECTOR (31 downto 0);
           data1 : out  STD_LOGIC_VECTOR (31 downto 0);
           data2 : out  STD_LOGIC_VECTOR (31 downto 0));
end component;
-------------------------------------------------------------
component ControlUnit is
    Port ( OpCode : in  STD_LOGIC_VECTOR (5 DOWNTO 0);
	 
           RegDst : out  STD_LOGIC;
			  jump :out STD_LOGIC;
			  Bneq:out STD_LOGIC;
			  Branch : out  STD_LOGIC;
           ALUSrc : out  STD_LOGIC;
           MemtoReg : out  STD_LOGIC;
           RegWrite : out  STD_LOGIC;
           MemRead : out  STD_LOGIC;
           MemWrite : out  STD_LOGIC;
           ALUOp1 : out  STD_LOGIC;
           ALUOp0 : out  STD_LOGIC);
end component;
-------------------------------------------------------------
component ALUControl is
    Port ( funct : in  STD_LOGIC_VECTOR(5 downto 0);
           ALUop : in  STD_LOGIC_VECTOR(1 downto 0);
           operation : inout  STD_LOGIC_VECTOR(3 downto 0));
end component;
-------------------------------------------------------------

component sign_extension is
    Port ( entry_index : in  STD_LOGIC_VECTOR (15 downto 0);
           out_index : out  STD_LOGIC_VECTOR (31 downto 0));
end component;
-------------------------------------------------------------


end Project_Package;

package body Project_Package is


end Project_Package;
