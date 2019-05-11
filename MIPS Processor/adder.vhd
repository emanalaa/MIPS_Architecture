----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:45:51 04/13/2019 
-- Design Name: 
-- Module Name:    adder - Behavioral 
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

library std ; 
use std.standard.all;

library work;
use work.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL ;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
			  carryin : in STD_LOGIC;
           result : out  STD_LOGIC;
           carry : out  STD_LOGIC);
end adder;

architecture Behavioral of adder is

signal tmp:STD_LOGIC_VECTOR(1 downto 0);
begin
tmp <= ('0' & a) + ('0' & b) + ('0' & carryin) ;
result <= tmp(0);
carry <= tmp(1);

end Behavioral;

