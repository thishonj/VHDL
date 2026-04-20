library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
  
entity t13_concurrent_tb is
end entity;
  
architecture sim of t13_concurrent_tb is
	signal Uns : unsigned(5 downto 0) := (others => '0'); -- signed 6
	signal Mul1 : unsigned(7 downto 0);
	signal Mul2 : unsigned(7 downto 0);
	signal Mul3 : unsigned(7 downto 0);
begin

	process is
	begin
		Uns <= Uns + 1;
		wait for 10 ns;
	end process;
	
	--Multiply Uns by 4
	process is
	begin
	    -- This shifts the variable by two bit and therfore Multiply with base 2
		Mul1 <= Uns & "00"; -- padding zeros to a 5 bit unsigned var
		wait on Uns; --wait till the 0 padded
	end process;
	
	process(Uns) is
	begin
		Mul2 <= Uns & "00";
	end process;

	Mul3 <= Uns & "00";
end architecture;  
