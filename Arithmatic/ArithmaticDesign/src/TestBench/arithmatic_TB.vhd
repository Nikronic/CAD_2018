library ieee;
use ieee.NUMERIC_STD.all;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;

-- Add your library and packages declaration here ...

entity arithmatic_tb is
end arithmatic_tb;

architecture TB_ARCHITECTURE of arithmatic_tb is
	-- Component declaration of the tested unit
	component arithmatic
		port(
			input : in STD_LOGIC_VECTOR(7 downto 0);
			sign_bit : in STD_LOGIC;
			unsigned_output : out STD_LOGIC_VECTOR(8 downto 0);
			ones : out STD_LOGIC_VECTOR(8 downto 0);
			twos : out STD_LOGIC_VECTOR(8 downto 0) );
	end component;
	
	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal input : STD_LOGIC_VECTOR(7 downto 0):= "00000000";
	signal sign_bit : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal unsigned_output : STD_LOGIC_VECTOR(8 downto 0);
	signal ones : STD_LOGIC_VECTOR(8 downto 0);
	signal twos : STD_LOGIC_VECTOR(8 downto 0);
	
	-- Add your code here ...
	constant period : time := 10 ns;
	
begin
	
	-- Unit Under Test port map
	UUT : arithmatic
	port map (
		input => input,
		sign_bit => sign_bit,
		unsigned_output => unsigned_output,
		ones => ones,
		twos => twos
		);
	
	-- Add your stimulus here ...
	input_process :process
	begin
		for i in 0 to 255 loop
			input <= input +1;	 
		end loop;
		wait for period;
	end process;  
	
	sign_bit_process :process
	begin
		sign_bit <= '0';
		wait for period/2;
		sign_bit <= '1';
		wait for period/2;
	end process;
	
	
	
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_arithmatic of arithmatic_tb is
	for TB_ARCHITECTURE
		for UUT : arithmatic
			use entity work.arithmatic(a);
		end for;
	end for;
end TESTBENCH_FOR_arithmatic;

