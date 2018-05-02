library ieee;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity sevensegmentdecoder_tb is
end sevensegmentdecoder_tb;

architecture TB_ARCHITECTURE of sevensegmentdecoder_tb is
	-- Component declaration of the tested unit
	component sevensegmentdecoder
	port(
		sev_seg_out : out STD_LOGIC_VECTOR(7 downto 0);
		binary_input : in STD_LOGIC_VECTOR(3 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal binary_input : STD_LOGIC_VECTOR(3 downto 0):= "0000";
	-- Observed signals - signals mapped to the output ports of tested entity
	signal sev_seg_out : STD_LOGIC_VECTOR(7 downto 0);

	-- Add your code here ...
	constant period : time := 10 ns;

begin

	-- Unit Under Test port map
	UUT : sevensegmentdecoder
		port map (
			sev_seg_out => sev_seg_out,
			binary_input => binary_input
		);

	-- Add your stimulus here ... 
	binary_input_process :process
	begin
		for i in 0 to 15 loop
			binary_input <= binary_input +1;	 
		end loop;
		wait for period;
	end process; 	
	

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_sevensegmentdecoder of sevensegmentdecoder_tb is
	for TB_ARCHITECTURE
		for UUT : sevensegmentdecoder
			use entity work.sevensegmentdecoder(ssd);
		end for;
	end for;
end TESTBENCH_FOR_sevensegmentdecoder;

