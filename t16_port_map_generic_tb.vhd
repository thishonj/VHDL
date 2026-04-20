library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
  
entity t16_port_map_generic_tb is
end entity;
  
architecture rtl of t16_port_map_generic_tb is
	constant Datawidth : integer := 8; -- type should be specified
	signal Sig1 : signed(Datawidth-1 downto 0) := x"AA";
	signal Sig2 : signed(Datawidth-1 downto 0) := x"BB";
	signal Sig3 : signed(Datawidth-1 downto 0) := x"CC";
	signal Sig4 : signed(Datawidth-1 downto 0) := x"DD";
	
	signal Sel : signed(1 downto 0) := (others => '0');
	
	signal Output : signed(Datawidth-1 downto 0);
begin
	--Instance of t16_generic_mux with architecture rtl
	i_Mux : entity work.t16_generic_mux(rtl)
	generic map(Datawidth => Datawidth) -- No semicolon here
	port map(
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
