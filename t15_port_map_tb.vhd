library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
  
entity t15_port_map_tb is
end entity;
  
architecture sim of t15_port_map_tb is
	signal Sig1 : unsigned(7 downto 0) := x"AA";
	signal Sig2 : unsigned(7 downto 0) := x"BB";
	signal Sig3 : unsigned(7 downto 0) := x"CC";
	signal Sig4 : unsigned(7 downto 0) := x"DD";
	
	signal Sel : unsigned(1 downto 0) := (others => '0');
	
	signal Output : unsigned(7 downto 0);
begin
	--Instance of t15_mux with architecture rtl
	i_Mux : entity work .t15_mux(rtl) port map(
		Sel => Sel,
		Sig1 => Sig1,
		Sig2 => Sig2,
		Sig3 => Sig3,
		Sig4 => Sig4,
		Output => Output);
		
	-- Test bench
	process is
	begin
		wait for 10 ns;
		Sel <= Sel + 1;
		wait for 10 ns;
		Sel <= Sel + 1;
		wait for 10 ns;
		Sel <= Sel + 1;
		wait for 10 ns;
		Sel <= Sel + 1;
		wait for 10 ns;
		Sel <= "UU";
		wait;
	end process;
	
end architecture;  
