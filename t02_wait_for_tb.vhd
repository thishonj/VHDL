entity t02_wait_for_tb is
end entity;

architecture sim of t02_wait_for_tb is
begin

	process is
	begin
		report "peekaboo";
		wait for 10 ns;
	end process;

end architecture;