entity t01_hello_world_tb is
end entity;

architecture sim of t01_hello_world_tb is
begin

	process is
	begin
		report "Hello World";
		wait;
	end process;

end architecture;