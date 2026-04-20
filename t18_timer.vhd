library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity t18_timer is
generic(clockFreq : integer);
port(
	clk : in std_logic;
	nRst : in std_logic;
	Seconds: inout integer; -- inout because when defined as out cannot read
	Minutes : inout integer;
	Hours: inout integer
	);
end entity;

architecture rtl of t18_timer is
 signal Ticks : integer;
begin
	process(clk) is
	begin
		if rising_edge(clk) then
			if nRst = '0' then
				Ticks <= 0;
				Seconds <= 0;
				Minutes <= 0;
				Hours <= 0;
			else
				--True every second
				if Ticks = clockFreq -1 then
					Ticks <= 0;
					--True every minute
					if Seconds = 59 then
						Seconds <= 0;
						-- True every hour
						if Minutes = 59 then
							Minutes <= 0;
							if Hours = 23 then
								Hours <= 0;
							else
								Hours <= Hours + 1;
							end if;
						else
							Minutes <= Minutes + 1;
						end if;
					else
						Seconds <= Seconds + 1;
					end if;
				else
					Ticks <= Ticks + 1;
				end if;
			end if;
		end if;
	end process;
end architecture;

