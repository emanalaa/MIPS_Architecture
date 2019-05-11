
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MUXRegDst is
    Port ( Dst1 : in STD_LOGIC_VECTOR (4 downto 0);
           Dst2 : in STD_LOGIC_VECTOR (4 downto 0);
           Selc : in STD_LOGIC;
           DestOut : out STD_LOGIC_VECTOR (4 downto 0));
end MUXRegDst;

architecture Behavioral of MUXRegDst is

begin

DestOut <=   Dst1 when Selc = '0' else 
				 Dst2 when Selc = '1' else 
				 "ZZZZZ";
end Behavioral;

