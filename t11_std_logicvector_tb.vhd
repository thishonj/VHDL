library ieee;
use ieee.std_logic_1164.all;

entity t11_std_logicvector_tb is
end entity;

architecture sim of t11_std_logicvector_tb is

	signal 	slv1 : std_logic_vector(7 downto 0); --unitialised
	signal 	slv2 : std_logic_vector(7 downto 0) := (others => '0'); --All vectors initialised to 0
	signal 	slv3 : std_logic_vector(7 downto 0) := (others => '1'); --Initialised to 1
	signal 	slv4 : std_logic_vector(7 downto 0) := x"AA"; --Initialised to Hex value AA (10101010)
	signal 	slv5 : std_logic_vector(0 to 7) := "10101010"; --Decimal Value
	signal 	slv6 : std_logic_vector(7 downto 0) := "00000001"; --A
	
begin

	process is
	begin
	
		wait for 10 ns;
		--Shift Register example
		for i in slv6'left downto slv6'right +1 loop  --slv6'left => 7(msb) & slv6'right => 0(lsb)
			slv6(i) <= slv6(i-1);
		end loop;
		
		--slv6(slv6'right ) <= slv6(slv6'left); --Direct shifting
		
	end process;

end architecture;