----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:39:37 04/15/2019 
-- Design Name: 
-- Module Name:    OneBitAlu - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Project_Package.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity OneBitAlu is
    Port ( data1 : in  STD_LOGIC;
           data2 : in  STD_LOGIC;
			  less: in STD_LOGIC;
           cin : in  STD_LOGIC;
           aluop : in  STD_LOGIC_VECTOR (1 DOWNTO 0);
			  aluop2 :in STD_LOGIC_VECTOR (1 DOWNTO 0);
           cout : out  STD_LOGIC;
           dataout : out  STD_LOGIC;
			  setRes:out STD_LOGIC);
end OneBitAlu;

architecture Behavioral of OneBitAlu is


signal AndR : STD_LOGIC;
signal OrR : STD_LOGIC;
signal notB : STD_LOGIC;
signal notA : STD_LOGIC;
signal AdderRes : STD_LOGIC;
signal Bout :STD_LOGIC;
signal Aout :STD_LOGIC;
begin
	
	
	notB <= not(data2);
	notA <= not(data1);
	AndR <= Aout and Bout;
	OrR <= data1 or data2;
	muxB: Mux2 PORT MAP(data2,notB, aluop2(0), Bout);
	muxA: Mux2 PORT MAP(data1,notA, aluop2(1), Aout);
	add: adder PORT MAP(Aout, Bout ,cin, AdderRes, cout);
	setRes <= AdderRes;
	mux2: Mux4 PORT MAP(AndR, OrR, AdderRes,less,aluop,aluop2, dataout ); --slt=less
	
	
end Behavioral;
