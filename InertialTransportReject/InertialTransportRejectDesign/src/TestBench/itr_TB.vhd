library ieee;
use ieee.std_logic_1164.all;

-- Add your library and packages declaration here ...

entity itr_tb is
end itr_tb;

architecture TB_ARCHITECTURE of itr_tb is
	-- Component declaration of the tested unit
	component itr
		port(
			qin : in STD_LOGIC;
			Y1 : out STD_LOGIC;
			Y2 : out STD_LOGIC;
			Y3 : out STD_LOGIC;
			Y4 : out STD_LOGIC;
			Y5 : out STD_LOGIC );
	end component;
	
	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal qin : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Y1 : STD_LOGIC;
	signal Y2 : STD_LOGIC;
	signal Y3 : STD_LOGIC;
	signal Y4 : STD_LOGIC;
	signal Y5 : STD_LOGIC;
	
	-- Add your code here ...
	
begin
	
	-- Unit Under Test port map
	UUT : itr
	port map (
		qin => qin,
		Y1 => Y1,
		Y2 => Y2,
		Y3 => Y3,
		Y4 => Y4,
		Y5 => Y5
		);
	
	qin <= '0', '1' after 10ns,'0' after 12ns,'1' after 14ns,'0' after 14.8ns,'1' after 16ns,'0' after 16.4ns, '1' after
	20ns,'0' after 22ns, '1' after 22.6ns;
	
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_itr of itr_tb is
	for TB_ARCHITECTURE
		for UUT : itr
			use entity work.itr(arc);
		end for;
	end for;
end TESTBENCH_FOR_itr;

