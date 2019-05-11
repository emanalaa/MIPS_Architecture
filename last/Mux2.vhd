library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux2 is
    Port ( I0 : in  STD_LOGIC;
           I1 : in  STD_LOGIC;
           Selector : in  STD_LOGIC;
           Output : out  STD_LOGIC);
end Mux2;

architecture Behavioral of Mux2 is

begin
	Output <= I0 when Selector = '0' else 
				 I1 when Selector = '1' else 
				 'Z';
end Behavioral;

