entity t05_while_loop_tb is
end entity;

architecture sim of t05_while_loop_tb is
begin

	process is
		variable i : integer := 0;
	begin
		
		while i<10 loop
			report "i=" & integer'image(i);
			i := i+2;
		end loop;
		wait;
		
	end process;

end architecture;