library ieee;
use ieee.std_logic_1164.all;
use ieee.STD_LOGIC_UNSIGNED.all;

	-- Add your library and packages declaration here ...

entity registersixteenbit_tb is
end registersixteenbit_tb;

architecture TB_ARCHITECTURE of registersixteenbit_tb is
	-- Component declaration of the tested unit
	component registersixteenbit
	port(
		i : in STD_LOGIC_VECTOR(15 downto 0);
		l : in STD_LOGIC;
		clr : in STD_LOGIC;
		clk : in STD_LOGIC;
		o : out STD_LOGIC_VECTOR(15 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal i : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000";
	signal l : STD_LOGIC;
	signal clr : STD_LOGIC := '0';
	signal clk : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal o : STD_LOGIC_VECTOR(15 downto 0);

	-- Add your code here ...  
	constant period : time := 100 ns;

begin

	-- Unit Under Test port map
	UUT : registersixteenbit
		port map (
			i => i,
			l => l,
			clr => clr,
			clk => clk,
			o => o
		);

	-- Add your stimulus here ...	
	
	clk_process :process
	begin
		clk <= '0';
		wait for period/2;
		clk <= '1';
		wait for period/2;
	end process; 
	
	l_process :process
	begin
		l <= '0';
		wait for period/5;
		l <= '1';
		wait for period/5;
	end process;
	
	i_process :process
	begin
		for j in 0 to 65536 loop
			i <= i +1;	 
		end loop;
		wait for period;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_registersixteenbit of registersixteenbit_tb is
	for TB_ARCHITECTURE
		for UUT : registersixteenbit
			use entity work.registersixteenbit(rsb);
		end for;
	end for;
end TESTBENCH_FOR_registersixteenbit;

