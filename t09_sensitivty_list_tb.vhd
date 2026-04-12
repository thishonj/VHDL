entity t09_sensitivty_list_tb is
end entity;

architecture sim of t09_sensitivty_list_tb is
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
		if CountUp = CountDown 	then
			report "Process A:";
		end if;
		wait on CountDown, CountUp;
	end process;
	
	process(CountUp, CountDown) is
	begin
		if CountUp = CountDown 	then
			report "Process : B";
		end if;
	end process;
	
	

end architecture;