entity t08_if_then_else_tb is
end entity;

architecture sim of t08_if_then_else_tb is
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
		if CountUp > CountDown 	then
			report "CountUp large";
		elsif CountUp < CountDown then
			report "CountDown large";
		else
			report "Equal";
		end if;
		wait on CountDown, CountUp;
	end process;
	

end architecture;