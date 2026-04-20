library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity t18_timer_tb is
end entity;

architecture sim of t18_timer_tb is
	constant clockFreq : integer := 100e6; --100MHz
	constant clockPeriod : time := 1000 ms / clockFreq; -- 1 s /clockFreq
	
	signal clk : std_logic := '1';
	signal nRst : std_logic := '0';
	signal Seconds: integer;
	signal Minutes: integer;
	signal Hours: integer;
	
begin
	-- Device Under Test(DUT) Instance mapping
	i_Timer : entity work.t18_timer(rtl)
	generic map(clockFreq => clockFreq)
	port map(
		clk => clk,
		nRst => nRst,
		Seconds => Seconds,
		Minutes => Minutes,
		Hours => Hours
	);
	
	clk <= not clk after clockPeriod / 2; --Process for clk generation
	
	process is
	begin
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		
		nRst <= '1';
        wait;
	end process;
	
end architecture;

