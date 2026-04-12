library ieee;
use ieee.std_logic_1164.all;

entity t10_std_logic_tb is
end entity;

architecture sim of t10_std_logic_tb is
signal 	Signal1 : std_logic := '0';
signal 	Signal2 : std_logic;
signal 	Signal3 : std_logic;
begin

	process is
	begin
		wait for 10 ns;
		Signal1 <= not Signal1;
	end process;

end architecture;