entity t07_wait_on_until_tb is
end entity;

architecture sim of t07_wait_on_until_tb is
signal CountUp : integer := 0;
signal CountDown : integer := 10;
begin

	process is
	begin
		CountUp <= CountUp + 1;
		CountDown <= CountDown -1;
		wait for 10 ns;
	end process;
	
	process is
	begin
		wait on CountUp, CountDown;
		Report "CountUp=" & integer'image(CountUp) &
		" CountDown=" & integer'image(CountDown);
	end process;
	
	process is
	begin
		wait until CountUp = CountDown;
		Report "Count same";
	end process;

end architecture;