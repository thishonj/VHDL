entity t03_loop_wait_tb is
end entity;

architecture sim of t03_loop_wait_tb is
begin

	process is
	begin
		report "Hello";
		
		loop
			report "peekaboo";
			exit;
		end loop;
		
		report "GoodBye";
		wait;
		
	end process;

end architecture;