library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;
use ieee.STD_LOGIC_UNSIGNED.all;

-- Add your library and packages declaration here ...

entity alu_tb is
end alu_tb;

architecture TB_ARCHITECTURE of alu_tb is
	-- Component declaration of the tested unit
	component alu
		port(
			Clk : in STD_LOGIC;
			Ain : in SIGNED(15 downto 0);
			Bin : in SIGNED(15 downto 0);
			Control : in STD_LOGIC_VECTOR(2 downto 0);
			ALUEn : in STD_LOGIC;
			Output : out SIGNED(15 downto 0) );
	end component;
	
	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal Clk : STD_LOGIC;
	signal Ain : SIGNED(15 downto 0) := "0000000000000000";
	signal Bin : SIGNED(15 downto 0) := "0000000000000000";
	signal Control : STD_LOGIC_VECTOR(2 downto 0) := "000";
	signal ALUEn : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Output : SIGNED(15 downto 0);
	
	-- Add your code here ...	
	constant period : time := 100 ns;
	
begin
	
	-- Unit Under Test port map
	UUT : alu
	port map (
		Clk => Clk,
		Ain => Ain,
		Bin => Bin,
		Control => Control,
		ALUEn => ALUEn,
		Output => Output
		);
	
	-- Add your stimulus here ...
	
	Ain_process :process
	begin
		for i in 0 to 65536 loop
			Ain <= Ain +1;	 
		end loop;
		wait for period;
	end process;
	
	Bin_process :process
	begin
		for i in 0 to 65536 loop
			Bin <= Bin +1;	 
		end loop;
		wait for period*2;
	end process;
	
	Clk_process :process
	begin
		Clk <= '0';
		wait for period/2;
		Clk <= '1';
		wait for period/2;
	end process; 
	
	Control_process :process
	begin
		for i in 0 to 7 loop
			Control <= Control +1;	 
		end loop;
		wait for period;
	end process;
	
	ALUEn_process :process
	begin
		ALUEn <= '0';
		wait for period/5;
		ALUEn <= '1';
		wait for period/5;
	end process;
	
	
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_alu of alu_tb is
	for TB_ARCHITECTURE
		for UUT : alu
			use entity work.alu(a);
		end for;
	end for;
end TESTBENCH_FOR_alu;

