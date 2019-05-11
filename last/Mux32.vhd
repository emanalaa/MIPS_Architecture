library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux32 is
    Port ( I0 : in  STD_LOGIC_VECTOR (31 downto 0);
           I1 : in  STD_LOGIC_VECTOR (31 downto 0);
           I2 : in  STD_LOGIC_VECTOR (31 downto 0);
           I3 : in  STD_LOGIC_VECTOR (31 downto 0);
           I4 : in  STD_LOGIC_VECTOR (31 downto 0);
           I5 : in  STD_LOGIC_VECTOR (31 downto 0);
           I6 : in  STD_LOGIC_VECTOR (31 downto 0);
           I7 : in  STD_LOGIC_VECTOR (31 downto 0);
           I8 : in  STD_LOGIC_VECTOR (31 downto 0);
           I9 : in  STD_LOGIC_VECTOR (31 downto 0);
           I10 : in  STD_LOGIC_VECTOR (31 downto 0);
           I11 : in  STD_LOGIC_VECTOR (31 downto 0);
           I12 : in  STD_LOGIC_VECTOR (31 downto 0);
           I13 : in  STD_LOGIC_VECTOR (31 downto 0);
           I14 : in  STD_LOGIC_VECTOR (31 downto 0);
           I15 : in  STD_LOGIC_VECTOR (31 downto 0);
           I16 : in  STD_LOGIC_VECTOR (31 downto 0);
           I17 : in  STD_LOGIC_VECTOR (31 downto 0);
           I18 : in  STD_LOGIC_VECTOR (31 downto 0);
           I19 : in  STD_LOGIC_VECTOR (31 downto 0);
           I20 : in  STD_LOGIC_VECTOR (31 downto 0);
           I21 : in  STD_LOGIC_VECTOR (31 downto 0);
           I22 : in  STD_LOGIC_VECTOR (31 downto 0);
           I23 : in  STD_LOGIC_VECTOR (31 downto 0);
           I24 : in  STD_LOGIC_VECTOR (31 downto 0);
           I25 : in  STD_LOGIC_VECTOR (31 downto 0);
           I26 : in  STD_LOGIC_VECTOR (31 downto 0);
           I27 : in  STD_LOGIC_VECTOR (31 downto 0);
           I28 : in  STD_LOGIC_VECTOR (31 downto 0);
           I29 : in  STD_LOGIC_VECTOR (31 downto 0);
           I30 : in  STD_LOGIC_VECTOR (31 downto 0);
           I31 : in  STD_LOGIC_VECTOR (31 downto 0);
           Selector : in  STD_LOGIC_VECTOR (4 downto 0);
           Output : out  STD_LOGIC_VECTOR (31 downto 0));
end Mux32;

architecture Behavioral of Mux32 is

begin
	Output <= I0  when selector = "00000" else
				 I1  when selector = "00001" else
				 I2  when selector = "00010" else
				 I3  when selector = "00011" else 
				 I4  when selector = "00100" else 
				 I5  when selector = "00101" else 
				 I6  when selector = "00110" else 
				 I7  when selector = "00111" else 
				 I8  when selector = "01000" else 
				 I9  when selector = "01001" else 
				 I10 when selector = "01010" else 
				 I11 when selector = "01011" else 
				 I12 when selector = "01100" else 
				 I13 when selector = "01101" else 
				 I14 when selector = "01110" else
				 I15 when selector = "01111" else 
				 I16 when selector = "10000" else
				 I17 when selector = "10001" else
				 I18 when selector = "10010" else
				 I19 when selector = "10011" else 
				 I20 when selector = "10100" else 
				 I21 when selector = "10101" else 
				 I22 when selector = "10110" else 
				 I23 when selector = "10111" else 
				 I24 when selector = "11000" else 
				 I25 when selector = "11001" else 
				 I26 when selector = "11010" else 
				 I27 when selector = "11011" else 
				 I28 when selector = "11100" else 
				 I29 when selector = "11101" else 
				 I30 when selector = "11110" else
				 I31 when selector = "11111" else 
				 "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
end Behavioral;

