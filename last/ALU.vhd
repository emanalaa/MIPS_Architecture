----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:25:36 04/15/2019 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use work.Project_Package.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( data1 : in  STD_LOGIC_VECTOR(31 downto 0);
           data2 : in  STD_LOGIC_VECTOR(31 downto 0);
           aluop : in  STD_LOGIC_VECTOR(3 downto 0);
           cin : in  STD_LOGIC;
           dataout : out  STD_LOGIC_VECTOR(31 downto 0);
           cflag : out  STD_LOGIC;
           zflag : out  STD_LOGIC;
           oflag : out  STD_LOGIC);
end ALU;



architecture Behavioral of ALU is
			signal selc1 : std_logic_vector(1 downto 0);
			signal selc2 : std_logic_vector(1 downto 0);
			signal dataout1 :  STD_LOGIC_VECTOR(31 downto 0);
			signal setRes :std_logic_vector(31 downto 0);
			signal cin0: std_logic;
			signal cin1: std_logic;
			signal cin2: std_logic;
			signal cin3: std_logic;
			signal cin4: std_logic;
			signal cin5: std_logic;
			signal cin6: std_logic;
			signal cin7: std_logic;
			signal cin8: std_logic;
			signal cin9: std_logic;
			signal cin10: std_logic;
			signal cin11: std_logic;
			signal cin12: std_logic;
			signal cin13: std_logic;
			signal cin14: std_logic;
			signal cin15: std_logic;
			signal cin16: std_logic;
			signal cin17: std_logic;
			signal cin18: std_logic;
			signal cin19: std_logic;
			signal cin20: std_logic;
			signal cin21: std_logic;
			signal cin22: std_logic;
			signal cin23: std_logic;
			signal cin24: std_logic;
			signal cin25: std_logic;
			signal cin26: std_logic;
			signal cin27: std_logic;
			signal cin28: std_logic;
			signal cin29: std_logic;
			signal cin30: std_logic;
			signal cin31: std_logic;

			signal cout0: std_logic;
			signal cout1: std_logic;
			signal cout2: std_logic;
			signal cout3: std_logic;
			signal cout4: std_logic;
			signal cout5: std_logic;
			signal cout6: std_logic;
			signal cout7: std_logic;
			signal cout8: std_logic;
			signal cout9: std_logic;
			signal cout10: std_logic;
			signal cout11: std_logic;
			signal cout12: std_logic;
			signal cout13: std_logic;
			signal cout14: std_logic;
			signal cout15: std_logic;
			signal cout16: std_logic;
			signal cout17: std_logic;
			signal cout18: std_logic;
			signal cout19: std_logic;
			signal cout20: std_logic;
			signal cout21: std_logic;
			signal cout22: std_logic;
			signal cout23: std_logic;
			signal cout24: std_logic;
			signal cout25: std_logic;
			signal cout26: std_logic;
			signal cout27: std_logic;
			signal cout28: std_logic;
			signal cout29: std_logic;
			signal cout30: std_logic;
			signal cout31: std_logic;

			signal ZeroFlag: std_logic;

			signal zero1: std_logic;
			signal zero2: std_logic;
			signal zero3: std_logic;
			signal zero4: std_logic;
			signal zero5: std_logic;
			signal zero6: std_logic;
			signal zero7: std_logic;
			signal zero8: std_logic;
			signal zero9: std_logic;
			signal zero10: std_logic;
			signal zero11: std_logic;
			signal zero12: std_logic;
			signal zero13: std_logic;
			signal zero14: std_logic;
			signal zero15: std_logic;
			signal zero16: std_logic;
			signal zero17: std_logic; 
			signal zero18: std_logic; 
			signal zero19: std_logic; 
			signal zero20: std_logic; 
			signal zero21: std_logic; 
			signal zero22: std_logic; 
			signal zero23: std_logic; 
			signal zero24: std_logic; 
			signal zero25: std_logic; 
			signal zero26: std_logic;
			signal zero27: std_logic;
			signal zero28: std_logic;
			signal zero29: std_logic;
			signal zero30: std_logic;
			signal zero31: std_logic;

			signal set: std_logic;


			begin
			selc1 <= aluop(1 downto 0);
			selc2 <= aluop(3 downto 2);

			alu0  : OneBitAlu PORT MAP(data1(0),data2(0),set,aluop(2),selc1,selc2,cout0,dataout1(0),setRes(0));
			--carry ib in alu0 is the 3rd bit of aluop as this bit indicates whether it is add or sub

			cin1 <= cout0;
			alu1  : OneBitAlu PORT MAP(data1(1),data2(1),'0',cin1,selc1,selc2,cout1,dataout1(1),setRes(1));

			cin2 <= cout1;
			alu2  : OneBitAlu PORT MAP(data1(2),data2(2),'0',cin2,selc1,selc2,cout2,dataout1(2),setRes(2));

			cin3 <= cout2;
			alu3  : OneBitAlu PORT MAP(data1(3),data2(3),'0',cin3,selc1,selc2,cout3,dataout1(3),setRes(3));

			cin4 <= cout3;
			alu4  : OneBitAlu PORT MAP(data1(4),data2(4),'0',cin4,selc1,selc2,cout4,dataout1(4),setRes(4));

			cin5 <= cout4;
			alu5  : OneBitAlu PORT MAP(data1(5),data2(5),'0',cin5,selc1,selc2,cout5,dataout1(5),setRes(5));

			cin6 <= cout5;
			alu6  : OneBitAlu PORT MAP(data1(6),data2(6),'0',cin6,selc1,selc2,cout6,dataout1(6),setRes(6));

			cin7 <= cout6;
			alu7  : OneBitAlu PORT MAP(data1(7),data2(7),'0',cin7,selc1,selc2,cout7,dataout1(7),setRes(7));

			cin8 <= cout7;
			alu8  : OneBitAlu PORT MAP(data1(8),data2(8),'0',cin8,selc1,selc2,cout8,dataout1(8),setRes(8));

			cin9 <= cout8;
			alu9  : OneBitAlu PORT MAP(data1(9),data2(9),'0',cin9,selc1,selc2,cout9,dataout1(9),setRes(9));

			cin10 <= cout9;
			alu10 : OneBitAlu PORT MAP(data1(10),data2(10),'0',cin10,selc1,selc2,cout10,dataout1(10),setRes(10));

			cin11 <= cout10;
			alu11 : OneBitAlu PORT MAP(data1(11),data2(11),'0',cin11,selc1,selc2,cout11,dataout1(11),setRes(11));

			cin12 <= cout11;
			alu12 : OneBitAlu PORT MAP(data1(12),data2(12),'0',cin12,selc1,selc2,cout12,dataout1(12),setRes(12));

			cin13 <= cout12;
			alu13 : OneBitAlu PORT MAP(data1(13),data2(13),'0',cin13,selc1,selc2,cout13,dataout1(13),setRes(13));

			cin14 <= cout13;
			alu14 : OneBitAlu PORT MAP(data1(14),data2(14),'0',cin14,selc1,selc2,cout14,dataout1(14),setRes(14));

			cin15 <= cout14;
			alu15 : OneBitAlu PORT MAP(data1(15),data2(15),'0',cin15,selc1,selc2,cout15,dataout1(15),setRes(15));

			cin16 <= cout15;
			alu16 : OneBitAlu PORT MAP(data1(16),data2(16),'0',cin16,selc1,selc2,cout16,dataout1(16),setRes(16));

			cin17 <= cout16;
			alu17 : OneBitAlu PORT MAP(data1(17),data2(17),'0',cin17,selc1,selc2,cout17,dataout1(17),setRes(17));

			cin18 <= cout17;
			alu18 : OneBitAlu PORT MAP(data1(18),data2(18),'0',cin18,selc1,selc2,cout18,dataout1(18),setRes(18));

			cin19 <= cout18;
			alu19 : OneBitAlu PORT MAP(data1(19),data2(19),'0',cin19,selc1,selc2,cout19,dataout1(19),setRes(19));

			cin20 <= cout19;
			alu20 : OneBitAlu PORT MAP(data1(20),data2(20),'0',cin20,selc1,selc2,cout20,dataout1(20),setRes(20));

			cin21 <= cout20;
			alu21 : OneBitAlu PORT MAP(data1(21),data2(21),'0',cin21,selc1,selc2,cout21,dataout1(21),setRes(21));

			cin22 <= cout21;
			alu22 : OneBitAlu PORT MAP(data1(22),data2(22),'0',cin22,selc1,selc2,cout22,dataout1(22),setRes(22));

			cin23 <= cout22;
			alu23 : OneBitAlu PORT MAP(data1(23),data2(23),'0',cin23,selc1,selc2,cout23,dataout1(23),setRes(23));

			cin24 <= cout23;
			alu24 : OneBitAlu PORT MAP(data1(24),data2(24),'0',cin24,selc1,selc2,cout24,dataout1(24),setRes(24));

			cin25 <= cout24;
			alu25 : OneBitAlu PORT MAP(data1(25),data2(25),'0',cin25,selc1,selc2,cout25,dataout1(25),setRes(25));

			cin26 <= cout25;
			alu26 : OneBitAlu PORT MAP(data1(26),data2(26),'0',cin26,selc1,selc2,cout26,dataout1(26),setRes(26));

			cin27 <= cout26;
			alu27 : OneBitAlu PORT MAP(data1(27),data2(27),'0',cin27,selc1,selc2,cout27,dataout1(27),setRes(27));

			cin28 <= cout27;
			alu28 : OneBitAlu PORT MAP(data1(28),data2(28),'0',cin28,selc1,selc2,cout28,dataout1(28),setRes(28));

			cin29 <= cout28;
			alu29 : OneBitAlu PORT MAP(data1(29),data2(29),'0',cin29,selc1,selc2,cout29,dataout1(29),setRes(29));

			cin30 <= cout29;
			alu30 : OneBitAlu PORT MAP(data1(30),data2(30),'0',cin30,selc1,selc2,cout30,dataout1(30),setRes(30));

			cin31 <= cout30;
			alu31 : OneBitAlu PORT MAP(data1(31),data2(31),'0',cin31,selc1,selc2,cout31,dataout1(31),setRes(31));

			set <= setRes(31);
			dataout<=dataout1;
			cflag <= cout31;
			zero1 <= dataout1(0) nor dataout1(1);
			zero2 <= zero1 nor dataout1(2);
			zero3 <= zero2 nor dataout1(3);
			zero4 <= zero3 nor dataout1(4);
			zero5 <= zero4 nor dataout1(5);
			zero6 <= zero5 nor dataout1(6);
			zero7 <= zero6 nor dataout1(7);
			zero8 <= zero7 nor dataout1(8);
			zero9 <= zero8 nor dataout1(9);
			zero10 <= zero9 nor dataout1(10);
			zero11 <= zero10 nor dataout1(11);
			zero12 <= zero11 nor dataout1(12);
			zero13 <= zero12 nor dataout1(13);
			zero14 <= zero13 nor dataout1(14);
			zero15 <= zero14 nor dataout1(15);
			zero16 <= zero15 nor dataout1(16);
			zero17 <= zero16 nor dataout1(17);
			zero18 <= zero17 nor dataout1(18);
			zero19 <= zero18 nor dataout1(19);
			zero20 <= zero19 nor dataout1(20);
			zero21 <= zero20 nor dataout1(21);
			zero22 <= zero21 nor dataout1(22);
			zero23 <= zero22 nor dataout1(23);
			zero24 <= zero23 nor dataout1(24);
			zero25 <= zero24 nor dataout1(25);
			zero26 <= zero25 nor dataout1(26);
			zero27 <= zero26 nor dataout1(27);
			zero28 <= zero27 nor dataout1(28);
			zero29 <= zero28 nor dataout1(29);
			zero30 <= zero29 nor dataout1(30);
			zero31 <= zero30 nor dataout1(31);
			
			zflag <= zero31;
			oflag <= cout31 xor cin31;
end Behavioral;

