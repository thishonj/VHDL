library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity t19_timer is
generic(clockFreq : integer);
port(
	clk : in std_logic;
	nRst : in std_logic;
	Seconds: inout integer; -- inout because when defined as out cannot read
	Minutes : inout integer;
	Hours: inout integer
	);
end entity;

architecture rtl of t19_timer is
 signal Ticks : integer;
 procedure IncrementWrap(signal counter : inout integer;
						constant WrapValue: in integer;
						constant Enable : in boolean; 
						variable Wrapped : out boolean) is
 begin
	if Enable then
		if counter = WrapValue - 1 then
			Wrapped := true;
			counter <= 0;
		else
			Wrapped := false;
			counter <= counter + 1;
		end if;
	end if;
 end procedure;
begin
	process(clk) is
	variable Wrap : boolean;
	begin
		if rising_edge(clk) then
			if nRst = '0' then
				Ticks <= 0;
				Seconds <= 0;
				Minutes <= 0;
				Hours <= 0;
			else
				--Cascaded counters
				IncrementWrap(Ticks, clockFreq, true, Wrap);
				IncrementWrap(Seconds, 60, Wrap, Wrap);
				IncrementWrap(Minutes, 60, Wrap, Wrap);
				IncrementWrap(Hours, 24, Wrap, Wrap);
			end if;
		end if;
	end process;
end architecture;

