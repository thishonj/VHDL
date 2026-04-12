entity t04_for_loop_tb is
end entity;

architecture sim of t04_for_loop_tb is
begin

	process is
	begin
		
		for i in 1 to 10 loop
			report "i=" & integer'image(i);
		end loop;
		wait;
		
	end process;

end architecture;