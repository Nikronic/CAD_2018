library ieee;
use ieee.NUMERIC_STD.all;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;

-- Add your library and packages declaration here ...

entity dma_tb is
	-- Generic declarations of the tested unit
	generic(
		data_width : INTEGER := 8;
		address_width : INTEGER := 8 );
end dma_tb;

architecture TB_ARCHITECTURE of dma_tb is
	-- Component declaration of the tested unit
	component dma
		generic(
			data_width : INTEGER := 8;
			address_width : INTEGER := 8 );
		port(
			clock : in STD_LOGIC;
			start : in STD_LOGIC;
			finish : out STD_LOGIC;
			addrSource : in STD_LOGIC_VECTOR(address_width-1 downto 0);
			addrDest : in STD_LOGIC_VECTOR(address_width-1 downto 0);
			copySize : in STD_LOGIC_VECTOR(address_width-1 downto 0) );
	end component;
	
	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clock : STD_LOGIC;
	signal start : STD_LOGIC;
	signal addrSource : STD_LOGIC_VECTOR(address_width-1 downto 0);
	signal addrDest : STD_LOGIC_VECTOR(address_width-1 downto 0);
	signal copySize : STD_LOGIC_VECTOR(address_width-1 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal finish : STD_LOGIC;
	
	-- Add your code here ...
	constant period : time := 10 ns;
	
begin
	
	-- Unit Under Test port map
	UUT : dma
	generic map (
		data_width => data_width,
		address_width => address_width
		)
	
	port map (
		clock => clock,
		start => start,
		finish => finish,
		addrSource => addrSource,
		addrDest => addrDest,
		copySize => copySize
		);
	
	-- Add your stimulus here ... 
	
	clock_process :process
	begin
		clock <= '0';
		wait for period/2;
		clock <= '1';
		wait for period/2;
	end process; 
	
	
	start <= '0','1' after 50ns;
	addrsource <= x"fe";                   
	addrdest <= x"fa" , x"00" after 50ns;                                                                      
	copysize <= x"02";
	
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_dma of dma_tb is
	for TB_ARCHITECTURE
		for UUT : dma
			use entity work.dma(a);
		end for;
	end for;
end TESTBENCH_FOR_dma;

