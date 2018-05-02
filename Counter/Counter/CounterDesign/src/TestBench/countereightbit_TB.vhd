library ieee;
use ieee.STD_LOGIC_SIGNED.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity countereightbit_tb is
end countereightbit_tb;

architecture TB_ARCHITECTURE of countereightbit_tb is
	-- Component declaration of the tested unit
	component countereightbit
	port(
		Clk : in STD_LOGIC;
		CountEn : in STD_LOGIC;
		Output : out STD_LOGIC_VECTOR(7 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal Clk : STD_LOGIC;
	signal CountEn : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Output : STD_LOGIC_VECTOR(7 downto 0);

	-- Add your code here ...	  
	constant period : time := 100 ns;

begin

	-- Unit Under Test port map
	UUT : countereightbit
		port map (
			Clk => Clk,
			CountEn => CountEn,
			Output => Output
		);

	-- Add your stimulus here ... 
	CountEn_process :process
	begin
		CountEn<= '0';
		wait for period*20;
		CountEn<='1';
		wait for period*2000;
	end process;
	
	Clk_process :process
	begin
		Clk <= '0';
		wait for period/2;
		Clk <= '1';
		wait for period/2;
	end process; 

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_countereightbit of countereightbit_tb is
	for TB_ARCHITECTURE
		for UUT : countereightbit
			use entity work.countereightbit(ceb);
		end for;
	end for;
end TESTBENCH_FOR_countereightbit;

