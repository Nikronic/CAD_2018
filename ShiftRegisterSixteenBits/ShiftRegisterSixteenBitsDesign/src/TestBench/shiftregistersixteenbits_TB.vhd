library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- Add your library and packages declaration here ...

entity shiftregistersixteenbits_tb is
end shiftregistersixteenbits_tb;

architecture TB_ARCHITECTURE of shiftregistersixteenbits_tb is
	-- Component declaration of the tested unit
	component shiftregistersixteenbits
		port(
			Clk : in STD_LOGIC;
			Reset : in STD_LOGIC;
			Load : in STD_LOGIC;
			ShR : in STD_LOGIC;
			ShL : in STD_LOGIC;
			DataIn : in STD_LOGIC_VECTOR(15 downto 0);
			Output : out STD_LOGIC_VECTOR(15 downto 0) );
	end component;
	
	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal Clk : STD_LOGIC;
	signal Reset : STD_LOGIC;
	signal Load : STD_LOGIC := '1';
	signal ShR : STD_LOGIC;
	signal ShL : STD_LOGIC;
	signal DataIn : STD_LOGIC_VECTOR(15 downto 0):= "0000000000000000";
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Output : STD_LOGIC_VECTOR(15 downto 0);
	
	-- Add your code here ...	  
	constant period : time := 100 ns;
	
begin
	
	-- Unit Under Test port map
	UUT : shiftregistersixteenbits
	port map (
		Clk => Clk,
		Reset => Reset,
		Load => Load,
		ShR => ShR,
		ShL => ShL,
		DataIn => DataIn,
		Output => Output
		);
	
	-- Add your stimulus here ... 
	
	Clk_process :process
	begin
		Clk<= '0';
		wait for period/2;
		Clk<= '1';
		wait for period/2;
	end process;
	
	Reset_process :process
	begin
		Reset<= '0';
		wait for period*115;
		Reset<= '1';
		wait for period*5;
	end process;
	
	Load_process :process
	begin
		Load<= '0';
		wait for period*100;
		Load<= '1';
		wait for period*2;
	end process; 
	
	ShR_process :process
	begin
		ShR<= '0';
		wait for period*12;
		ShR<= '1';
		wait for period;
	end process;
	
	ShL_process :process
	begin
		ShL<= '0';
		wait for period*18;
		ShL<= '1';
		wait for period;
	end process;  
	
	DataIn_process :process
	begin
		for i in 0 to 65536 loop
			DataIn <= DataIn +1;	 
		end loop;
		wait for period;
	end process;
	
	
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_shiftregistersixteenbits of shiftregistersixteenbits_tb is
	for TB_ARCHITECTURE
		for UUT : shiftregistersixteenbits
			use entity work.shiftregistersixteenbits(srsb);
		end for;
	end for;
end TESTBENCH_FOR_shiftregistersixteenbits;

