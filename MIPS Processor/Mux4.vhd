----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:42:57 04/15/2019 
-- Design Name: 
-- Module Name:    Mux4 - Behavioral 
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

entity Mux4 is
    Port ( I0 : in  STD_LOGIC;
           I1 : in  STD_LOGIC;
           I2 : in  STD_LOGIC;
           I3 : in  STD_LOGIC;
           selector1 : in  STD_LOGIC_VECTOR (1 DOWNTO 0);
           selector2 : in  STD_LOGIC_VECTOR (1 DOWNTO 0);
           result : out  STD_LOGIC);
end Mux4;

architecture Behavioral of Mux4 is

begin
result <= I0 when selector1 = "00" else 
          I1 when selector1 = "01" else 
		    I2 when selector1 = "10" else 
		    I3 ;

end Behavioral;

