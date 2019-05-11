----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:05:20 04/27/2019 
-- Design Name: 
-- Module Name:    sign_extension - Behavioral 
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

entity sign_extension is
    Port ( entry_index : in  STD_LOGIC_VECTOR (15 downto 0);
           out_index : out  STD_LOGIC_VECTOR (31 downto 0));
end sign_extension;

architecture Behavioral of sign_extension is
SIGNAL Tmp: STD_LOGIC_VECTOR (31 DOWNTO 0);

begin
	Tmp <=( entry_index(15) & entry_index(15) & entry_index(15) & entry_index(15) & entry_index(15) & entry_index(15) & entry_index(15) & entry_index(15) & entry_index(15) & entry_index(15) & entry_index(15) & entry_index(15) & entry_index(15) & entry_index(15) & entry_index(15) & entry_index(15) & entry_index);
	out_index <= Tmp;
end Behavioral;

