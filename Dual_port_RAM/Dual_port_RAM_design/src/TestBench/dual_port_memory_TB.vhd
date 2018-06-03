library ieee;
use ieee.NUMERIC_STD.all;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

-- Add your library and packages declaration here ...

entity dual_port_memory_tb is
	-- Generic declarations of the tested unit
	generic(
		data_width : INTEGER := 8;
		address_width : INTEGER := 8 );
end dual_port_memory_tb;

architecture TB_ARCHITECTURE of dual_port_memory_tb is
	-- Component declaration of the tested unit
	component dual_port_memory
		generic(
			data_width : INTEGER := 8;
			address_width : INTEGER := 8 );
		port(
			clk : in STD_LOGIC;
			cs1 : in STD_LOGIC;
			we1 : in STD_LOGIC;
			cs2 : in STD_LOGIC;
			we2 : in STD_LOGIC;
			data1 : inout STD_LOGIC_VECTOR(data_width-1 downto 0);
			data2 : inout STD_LOGIC_VECTOR(data_width-1 downto 0);
			addr1 : in STD_LOGIC_VECTOR(address_width-1 downto 0);
			addr2 : in STD_LOGIC_VECTOR(address_width-1 downto 0) );
	end component;
	
	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC;
	signal cs1 : STD_LOGIC;
	signal we1 : STD_LOGIC;
	signal cs2 : STD_LOGIC;
	signal we2 : STD_LOGIC;
	signal addr1 : STD_LOGIC_VECTOR(address_width-1 downto 0);
	signal addr2 : STD_LOGIC_VECTOR(address_width-1 downto 0);
	signal data1 : STD_LOGIC_VECTOR(data_width-1 downto 0);
	signal data2 : STD_LOGIC_VECTOR(data_width-1 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	
	-- Add your code here ...
	-- constant period : time := 100 ns;
	constant period : time := 10 ns;
	
begin
	
	-- Unit Under Test port map
	UUT : dual_port_memory
	generic map (
		data_width => data_width,
		address_width => address_width
		)
	
	port map (
		clk => clk,
		cs1 => cs1,
		we1 => we1,
		cs2 => cs2,
		we2 => we2,
		data1 => data1,
		data2 => data2,
		addr1 => addr1,
		addr2 => addr2
		);
	
	-- Add your stimulus here ... 
	
	
	clk_process :process
	begin
		clk <= '0';
		wait for period/2;
		clk <= '1';
		wait for period/2;
	end process; 
	
	--cs1_process :process
	--	begin
	--		cs1 <= '1' after 100 ns, '0' after 1000 ns, '0' after 1100 ns;
	--		wait for period*100;
	--	end process;
	--	
	--	we1_process :process
	--	begin
	--		we1 <= '1' after 95 ns , '0' after 395 ns;
	--		wait for period*100;
	--	end process;
	--	
	--	addr1_process :process
	--	begin
	--		addr1 <= "00000001" after 90 ns , "00000010" after 210 ns , "00000001" after 400 ns , "00000010" after 510 ns;
	--		wait for period*100;
	--	end process;
	--	
	--	data1_process :process
	--	begin
	--		data1 <= "00000100" after 110 ns;
	--		data1 <= "00000101" after 220 ns;	
	--		wait for period*100;
	--	end process; 
	
	--process
	--	begin
	--		--these 4 lines shows that when port is not enabled, we cannot perform write or read operation.
	--		cs1 <= '0';
	--		we1 <= '1';
	--		data1 <= X"FF";
	--		addr1<= X"01";  
	--		wait for period*4;
	--		
	--		--Write all the locations of RAM
	--		cs1 <= '1';   
	--		for i in 0 to 255 loop
	--			data1 <= conv_std_logic_vector(i,8);
	--			addr1 <= conv_std_logic_vector(i,8);
	--			wait for period*2;
	--		end loop;
	--		
	--		cs1<='0';
	--		we1 <= '0';
	--		cs2 <= '1';
	--		we2 <= '0';
	--		
	--		--Read from port 2, all the locations of RAM.	
	--		for i in 0 to 255 loop
	--			addr2 <= conv_std_logic_vector(i,8); 
	--			wait for period*2;
	--		end loop;
	--		cs1 <= '0';
	--		wait for period*4;
	--		cs1 <= '0';
	--		cs2 <= '0';
	--	end process;
	
	data1<=x"81" after 5ns, x"54" after 20ns;                   
	addr1<=x"01", x"05" after 20ns, x"01" after 30ns;                                                                     
	cs1<='1', '0' after 300 ns;                                                                      
	we1<='1',  '0' after 10ns,'1' after 20ns, '0' after 40ns;
	
	data2<=x"81" after 5ns, x"54" after 20ns;                   
	addr2<=x"01", x"05" after 20ns, x"01" after 30ns;                                                                      
	cs2<='1', '0' after 300 ns;                                                                     
	we2<='1',  '0' after 10ns,'1' after 20ns, '0' after 40ns;
	
	
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_dual_port_memory of dual_port_memory_tb is
	for TB_ARCHITECTURE
		for UUT : dual_port_memory
			use entity work.dual_port_memory(dpm);
		end for;
	end for;
end TESTBENCH_FOR_dual_port_memory;

