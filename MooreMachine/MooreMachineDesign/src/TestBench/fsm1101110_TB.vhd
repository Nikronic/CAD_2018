library ieee;
use ieee.std_logic_1164.all;
use ieee.STD_LOGIC_UNSIGNED.all;

-- Add your library and packages declaration here ...

entity fsm1101110_tb is
end fsm1101110_tb;

architecture TB_ARCHITECTURE of fsm1101110_tb is
	-- Component declaration of the tested unit
	component fsm1101110
		port(
			input : in STD_LOGIC;
			clk : in STD_LOGIC;
			reset : in STD_LOGIC;
			output : out STD_LOGIC );
	end component;
	
	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal input : STD_LOGIC;
	signal clk : STD_LOGIC;
	signal reset : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal output : STD_LOGIC;	 
	
	
	-- Add your code here ...
	constant period : time := 100 ns;
	
	
begin
	
	-- Unit Under Test port map
	UUT : fsm1101110
	port map (
		input => input,
		clk => clk,
		reset => reset,
		output => output
		);	 
	
	-- Add your stimulus here ...  
	clk_process :process
	begin
		clk <= '0';
		wait for period/2;
		clk <= '1';
		wait for period/2;
	end process; 
	
	input_process :process
	begin		 -- 1 1101110 1110
		input <= '1' after 110 ns ,'1' after 210 ns , '1' after 310 ns, '0' after 410 ns, '1' after 510 ns , '1' after 610 ns , '1' after 710 ns, '0' after 810 ns, '1' after 910 ns, '1' after 1010 ns, '1' after 1110 ns, '0' after 1210 ns;
		wait for period*100;
	end process; 
	
	reset_process :process
	begin
		reset <= '1';
		wait for period;
		reset <= '0';
		wait for period*25;
	end process; 
	
	
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_fsm1101110 of fsm1101110_tb is
	for TB_ARCHITECTURE
		for UUT : fsm1101110
			use entity work.fsm1101110(fsm);
		end for;
	end for;
end TESTBENCH_FOR_fsm1101110;

