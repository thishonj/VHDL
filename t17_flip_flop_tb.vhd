library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity t17_flip_flop_tb is
end entity;

architecture rtl of t17_flip_flop_tb is
	constant clockFreq : integer := 100e6; --100MHz
	constant clockPeriod : time := 1000 ms / clockFreq; -- 1 s /clockFreq
	
	signal clk : std_logic := '1';
	signal nRst : std_logic := '0';
	signal Input : std_logic := '0';
	signal Output : std_logic;
	
begin
	-- Device Under Test(DUT) Instance mapping
	i_FlipFlop : entity work.t17_flip_flop(rtl)
	port map(
		clk => clk,
		nRst => nRst,
		Input => Input,
		Output => Output
	);
	
	clk <= not clk after clockPeriod / 2; --Process for clk generation
	
	process is
	begin
		-- Take the DUT out of reset
        nRst <= '1';
  
        wait for 20 ns;
        Input <= '1';
        wait for 22 ns;
        Input <= '0';
        wait for 6 ns;
        Input <= '1';
        wait for 20 ns;
  
        -- Reset the DUT
        nRst <= '0';
        wait;
	end process;
	
end architecture;

