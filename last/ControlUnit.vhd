----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:33:11 04/27/2019 
-- Design Name: 
-- Module Name:    ControlUnit - Behavioral 
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


entity ControlUnit is
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
end ControlUnit;

architecture Behavioral of ControlUnit is
signal RformatAndGate: std_logic;
signal LwAndGate: std_logic;
signal SwAndGate: std_logic;
signal beqAndGate: std_logic;
signal bneqAndGate:std_logic;
signal jumpAndGate:std_logic;

signal notop0: std_logic;
signal notop1: std_logic;
signal notop2: std_logic;
signal notop3: std_logic;
signal notop4: std_logic;
signal notop5: std_logic;

signal s_R:std_logic_vector(4 downto 0);
signal s_lw: std_logic_vector(4 downto 0);
signal s_sw: std_logic_vector(4 downto 0);
signal s_beq: std_logic_vector(4 downto 0);
signal s_bneq: std_logic_vector(4 downto 0);
signal s_jump: std_logic_vector(4 downto 0);

begin

notop0 <= not(OpCode(0));
notop1 <= not(OpCode(1));
notop2 <= not(OpCode(2));
notop3 <= not(OpCode(3));
notop4 <= not(OpCode(4));
notop5 <= not(OpCode(5));


---------Rformat Gate
s_R(0) <= notop0 and notop1;
s_R(1) <= s_R(0) and notop2;
s_R(2) <= s_R(1) and notop3;
s_R(3) <= s_R(2) and notop4;
s_R(4) <= s_R(3) and notop5;
RformatAndGate<= s_R(4); 

---------Lw And Gate
s_lw(0) <= notop4 and notop3;
s_lw(1) <= s_lw(0) and notop2;
s_lw(2) <= s_lw(1) and OpCode(0);
s_lw(3) <= s_lw(2) and OpCode(1);
s_lw(4) <= s_lw(3) and OpCode(5);
LwAndGate <= s_lw(4);

---------sw And Gate
s_sw(0) <= notop4 and notop2;
s_sw(1) <= s_sw(0) and OpCode(0);
s_sw(2) <= s_sw(1) and OpCode(1);
s_sw(3) <= s_sw(2) and OpCode(3);
s_sw(4) <= s_sw(3) and OpCode(5);
SwAndGate <= s_sw(4); 

---------Beq And Gate
s_beq(0) <= notop0 and notop1;
s_beq(1) <= s_beq(0) and OpCode(2);
s_beq(2) <= s_beq(1) and notop3;
s_beq(3) <= s_beq(2) and notop4;
s_beq(4) <= s_beq(3) and notop5;
beqAndGate <= s_beq(4);

---------Bneq And Gate
s_bneq(0) <= OpCode(0) and OpCode(2);
s_bneq(1) <= s_bneq(0) and notop1;
s_bneq(2) <= s_bneq(1) and notop3;
s_bneq(3) <= s_bneq(2) and notop4;
s_bneq(4) <= s_bneq(3) and notop5;
bneqAndGate <= s_bneq(4);
---------jump
s_jump(0) <= OpCode(1) and notop0;
s_jump(1) <= s_jump(0) and notop2;
s_jump(2) <= s_jump(1) and notop3;
s_jump(3) <= s_jump(2) and notop4;
s_jump(4) <= s_jump(3) and notop5;
jumpAndGate <= s_jump(4);

----------ORGate to output Alusrc

----------outputs
ALUSrc <= LwAndGate or SwAndGate;
RegWrite <= RformatAndGate or LwAndGate;
RegDst <= RformatAndGate;
MemtoReg <= LwAndGate;
MemRead <= LwAndGate ;
MemWrite <= SwAndGate;
Branch <= beqAndGate;----
jump <= jumpAndGate ;
Bneq <= bneqAndGate;
ALUOp1 <= RformatAndGate;
ALUOp0 <= beqAndGate;----

end Behavioral;

