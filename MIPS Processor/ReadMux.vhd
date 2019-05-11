
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ReadMux is
    Port ( Input1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Input2 : in  STD_LOGIC_VECTOR (31 downto 0);
           selc : in  STD_LOGIC;
           Output1 : out  STD_LOGIC_VECTOR (31 downto 0));
end ReadMux;

architecture Behavioral of ReadMux is

begin
Output1 <=   Input1  when selc = '0' else 
				 Input2  when selc = '1' else 
				 "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";

end Behavioral;

