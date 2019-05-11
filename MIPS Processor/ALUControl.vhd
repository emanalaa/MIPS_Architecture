----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:44:45 04/27/2019 
-- Design Name: 
-- Module Name:    ALUControl - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALUControl is
    Port ( funct : in  STD_LOGIC_VECTOR(5 downto 0);
           ALUop : in  STD_LOGIC_VECTOR(1 downto 0);
           operation : inout  STD_LOGIC_VECTOR(3 downto 0));
end ALUControl;

architecture Behavioral of ALUControl is

SIGNAL temp_operation3: STD_LOGIC;

begin
operation(3) <= (funct(0) and funct(1)) and ALUop(1); 
temp_operation3 <= operation(3);
operation(2) <= (ALUop(1) and funct(1)) or ALUop(0); 
operation(1) <= (not ALUop(1)) or (not funct(2)); 
operation(0) <= (funct(3) or funct(0)) and (ALUop(1) and not(temp_operation3));


end Behavioral;

