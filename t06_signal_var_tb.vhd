entity t06_signal_var_tb is
end entity;

architecture sim of t06_signal_var_tb is
	signal Mysignal : integer := 0; 

begin

	process is
		variable MyVariable : integer := 0;
	begin
	
		report "----Process start----";
		MyVariable := MyVariable + 1;
		Mysignal <= Mysignal + 1;
		
		report "MyVariable = " & integer'image(MyVariable) &
			" ,Mysignal = " & integer'image(Mysignal);
			
		wait for 10 ns;
			
	end process;

end architecture;