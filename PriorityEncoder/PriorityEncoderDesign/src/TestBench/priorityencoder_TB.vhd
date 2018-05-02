library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity priorityencoder_tb is
end priorityencoder_tb;

architecture TB_ARCHITECTURE of priorityencoder_tb is
	-- Component declaration of the tested unit
	component priorityencoder
	port(
		a : in STD_LOGIC_VECTOR(7 downto 0);
		z : out STD_LOGIC_VECTOR(2 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal a : STD_LOGIC_VECTOR(7 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal z : STD_LOGIC_VECTOR(2 downto 0);

	-- Add your code here ... 
	constant period : time := 10 ns;

begin

	-- Unit Under Test port map
	UUT : priorityencoder
		port map (
			a => a,
			z => z
		);

	-- Add your stimulus here ...
	
	
	a_process :process
	begin
		a <= "11101000";
		wait for period;
		a <= "00001000";
		wait for period;
		a <= "00001001";
		wait for period;
		a <= "10001000";
		wait for period;
		a <= "11001000";
		wait for period;
		a <= "01000000";
		wait for period;
		a <= "00100000";
		wait for period;
		a <= "00000001";
		wait for period;
	end process;
	
	

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_priorityencoder of priorityencoder_tb is
	for TB_ARCHITECTURE
		for UUT : priorityencoder
			use entity work.priorityencoder(pe);
		end for;
	end for;
end TESTBENCH_FOR_priorityencoder;

