library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use work.Project_Package.ALL;

entity RegisterFile is
    Port ( read_sel1 : in  STD_LOGIC_VECTOR (4 downto 0);
           read_sel2 : in  STD_LOGIC_VECTOR (4 downto 0);
           write_sel : in  STD_LOGIC_VECTOR (4 downto 0);
           write_ena : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           write_data : in  STD_LOGIC_VECTOR (31 downto 0);
           data1 : out  STD_LOGIC_VECTOR (31 downto 0);
           data2 : out  STD_LOGIC_VECTOR (31 downto 0));
end RegisterFile;

architecture Behavioral of RegisterFile is
	SIGNAL decoder_output: STD_LOGIC_VECTOR (31 downto 0);
	signal Rout0 , Rout1,  Rout2,  Rout3,  Rout4,  Rout5,  Rout6,  Rout7,  Rout8,  Rout9,  Rout10, Rout11, Rout12, Rout13, Rout14, Rout15 :std_logic_vector(31 downto 0);
	signal Rout16, Rout17, Rout18, Rout19, Rout20, Rout21, Rout22, Rout23, Rout24, Rout25, Rout26, Rout27, Rout28, Rout29, Rout30, Rout31 :std_logic_vector(31 downto 0);
	signal t0, t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23, t24, t25, t26, t27, t28, t29, t30, t31 :std_logic ;
begin
	mux32_1: Mux32 PORT MAP (Rout0,Rout1,Rout2,Rout3,Rout4,Rout5,Rout6,Rout7,Rout8,Rout9,Rout10,Rout11,Rout12,Rout13,Rout14,Rout15,Rout16,Rout17,Rout18,Rout19,Rout20,Rout21,Rout22,Rout23,Rout24,Rout25,Rout26,Rout27,Rout28,Rout29,Rout30,Rout31,read_sel1,data1);
	mux32_2: Mux32 PORT MAP (Rout0,Rout1,Rout2,Rout3,Rout4,Rout5,Rout6,Rout7,Rout8,Rout9,Rout10,Rout11,Rout12,Rout13,Rout14,Rout15,Rout16,Rout17,Rout18,Rout19,Rout20,Rout21,Rout22,Rout23,Rout24,Rout25,Rout26,Rout27,Rout28,Rout29,Rout30,Rout31,read_sel2,data2);
	 
	--not sure from enable
	decoder_1: Decoder PORT MAP(write_sel, '1', decoder_output);
	
	t0  <= (decoder_output(0) and write_ena);
	t1  <= (decoder_output(1) and write_ena);
	t2  <= (decoder_output(2) and write_ena);
	t3  <= (decoder_output(3) and write_ena);
	t4  <= (decoder_output(4) and write_ena);
	t5  <= (decoder_output(5) and write_ena);
	t6  <= (decoder_output(6) and write_ena);
	t7  <= (decoder_output(7) and write_ena);
	t8  <= (decoder_output(8) and write_ena);
	t9  <= (decoder_output(9) and write_ena);
	t10 <= (decoder_output(10) and write_ena);
	t11 <= (decoder_output(11) and write_ena);
	t12 <= (decoder_output(12) and write_ena);
	t13 <= (decoder_output(13) and write_ena);
	t14 <= (decoder_output(14) and write_ena);
	t15 <= (decoder_output(15) and write_ena);
	t16 <= (decoder_output(16) and write_ena);
	t17 <= (decoder_output(17) and write_ena);
	t18 <= (decoder_output(18) and write_ena);
	t19 <= (decoder_output(19) and write_ena);
	t20 <= (decoder_output(20) and write_ena);
	t21 <= (decoder_output(21) and write_ena);
	t22 <= (decoder_output(22) and write_ena);
	t23 <= (decoder_output(23) and write_ena);
	t24 <= (decoder_output(24) and write_ena);
	t25 <= (decoder_output(25) and write_ena);
	t26 <= (decoder_output(26) and write_ena);
	t27 <= (decoder_output(27) and write_ena);
	t28 <= (decoder_output(28) and write_ena);
	t29 <= (decoder_output(29) and write_ena);
	t30 <= (decoder_output(30) and write_ena);
	t31 <= (decoder_output(31) and write_ena);
 	
	R0 : reg GENERIC MAP (32) PORT MAP (write_data,clk,t0 ,'0','0',Rout0 );
	R1 : reg GENERIC MAP (32) PORT MAP (write_data,clk,t1 ,'0','0',Rout1 );
	R2 : reg GENERIC MAP (32) PORT MAP (write_data,clk,t2 ,'0','0',Rout2 );
	R3 : reg GENERIC MAP (32) PORT MAP (write_data,clk,t3 ,'0','0',Rout3 );
	R4 : reg GENERIC MAP (32) PORT MAP (write_data,clk,t4 ,'0','0',Rout4 );
	R5 : reg GENERIC MAP (32) PORT MAP (write_data,clk,t5 ,'0','0',Rout5 );
	R6 : reg GENERIC MAP (32) PORT MAP (write_data,clk,t6 ,'0','0',Rout6 );
	R7 : reg GENERIC MAP (32) PORT MAP (write_data,clk,t7 ,'0','0',Rout7 );
	R8 : reg GENERIC MAP (32) PORT MAP (write_data,clk,t8 ,'0','0',Rout8 );
	R9 : reg GENERIC MAP (32) PORT MAP (write_data,clk,t9 ,'0','0',Rout9 );
	R10: reg GENERIC MAP (32) PORT MAP (write_data,clk,t10,'0','0',Rout10);
	R11: reg GENERIC MAP (32) PORT MAP (write_data,clk,t11,'0','0',Rout11);
	R12: reg GENERIC MAP (32) PORT MAP (write_data,clk,t12,'0','0',Rout12);
	R13: reg GENERIC MAP (32) PORT MAP (write_data,clk,t13,'0','0',Rout13);
	R14: reg GENERIC MAP (32) PORT MAP (write_data,clk,t14,'0','0',Rout14);
	R15: reg GENERIC MAP (32) PORT MAP (write_data,clk,t15,'0','0',Rout15);
	R16: reg GENERIC MAP (32) PORT MAP (write_data,clk,t16,'0','0',Rout16);
	R17: reg GENERIC MAP (32) PORT MAP (write_data,clk,t17,'0','0',Rout17);
	R18: reg GENERIC MAP (32) PORT MAP (write_data,clk,t18,'0','0',Rout18);
	R19: reg GENERIC MAP (32) PORT MAP (write_data,clk,t19,'0','0',Rout19);
	R20: reg GENERIC MAP (32) PORT MAP (write_data,clk,t20,'0','0',Rout20);
	R21: reg GENERIC MAP (32) PORT MAP (write_data,clk,t21,'0','0',Rout21);
	R22: reg GENERIC MAP (32) PORT MAP (write_data,clk,t22,'0','0',Rout22);
	R23: reg GENERIC MAP (32) PORT MAP (write_data,clk,t23,'0','0',Rout23);
	R24: reg GENERIC MAP (32) PORT MAP (write_data,clk,t24,'0','0',Rout24);
	R25: reg GENERIC MAP (32) PORT MAP (write_data,clk,t25,'0','0',Rout25);
	R26: reg GENERIC MAP (32) PORT MAP (write_data,clk,t26,'0','0',Rout26);
	R27: reg GENERIC MAP (32) PORT MAP (write_data,clk,t27,'0','0',Rout27);
	R28: reg GENERIC MAP (32) PORT MAP (write_data,clk,t28,'0','0',Rout28);
	R29: reg GENERIC MAP (32) PORT MAP (write_data,clk,t29,'0','0',Rout29);
	R30: reg GENERIC MAP (32) PORT MAP (write_data,clk,t30,'0','0',Rout30);
	R31: reg GENERIC MAP (32) PORT MAP (write_data,clk,t31,'0','0',Rout31);


end Behavioral;

