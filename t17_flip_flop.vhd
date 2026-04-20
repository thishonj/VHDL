library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity t17_flip_flop is
port(
	clk : in std_logic;
	nRst : in std_logic;
	Input : in std_logic;
	Output : out std_logic
);
end entity;

architecture rtl of t17_flip_flop is
begin
-- Flip flop with synchronous reset
	process(clk) is
	begin
		if rising_edge(clk) then
			if nRst = '0' then
				Output <= '0';
			else
				Output <= Input;
			end if;
		end if;
	end process;
end architecture;

