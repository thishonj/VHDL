library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity t17_clock_gen_tb is
end entity;

architecture rtl of t17_clock_gen_tb is
	constant clockFreq : integer := 100e6; --100MHz
	constant clockPeriod : time := 1000 ms / clockFreq; -- 1 s /clockFreq
	
	signal clk : std_logic := '1';
begin
	clk <= not clk after clockPeriod / 2; --Process for clk generation
end architecture;

