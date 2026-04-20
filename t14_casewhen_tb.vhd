library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
  
entity t14_casewhen_tb is
end entity;
  
architecture sim of t14_casewhen_tb is
	signal Sig1 : unsigned(7 downto 0) := x"AA";
	signal Sig2 : unsigned(7 downto 0) := x"BB";
	signal Sig3 : unsigned(7 downto 0) := x"CC";
	signal Sig4 : unsigned(7 downto 0) := x"DD";
	signal Sel : unsigned(1 downto 0) := (others => '0');
	signal Out1 : unsigned(7 downto 0);
	signal Out2 : unsigned(7 downto 0);
begin
	--Stimuli for test
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
	
	process(sel, Sig1, Sig2, Sig3, Sig4) is
	begin
		if Sel = "00" then
			Out1 <= Sig1;
		elsif Sel = "01" then
			Out1 <= Sig2;
		elsif Sel = "10" then
			Out1 <= Sig3;
		elsif Sel = "11" then
			Out1 <= Sig4;
		else
			Out1 <= (others => 'X'); -- for all other cases
		end if;
	end process;
	
	process(sel, Sig1, Sig2, Sig3, Sig4) is
	begin
		case Sel is 
			when  "00" =>
				Out2 <= Sig1;
			when  "01" =>
				Out2 <= Sig2;
			when  "10" =>
				Out2 <= Sig3;
			when  "11" =>
				Out2 <= Sig4;
			when others =>
				Out2 <= (others => 'X'); -- for all other cases
		end case;
	end process;
	
end architecture;  
