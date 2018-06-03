-------------------------------------------------------------------------------
--
-- Title       : dual_port_memory
-- Design      : Dual_port_RAM_design
-- Author      : Mohammad Doosti Lakhani
-- Student ID  : 94012269021 
--
-------------------------------------------------------------------------------
--
-- File        : dual_port_memory.vhd
-- Generated   : Fri May 25 23:13:41 2018
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : A memory(RAM) which can be controlled by two address port.
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {dual_port_memory} architecture {dpm}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;   
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity dual_port_memory is
	generic (data_width,address_width : integer := 8);
	port (
		clk,cs1,we1,cs2,we2 : in std_logic;
		data1,data2 : inout std_logic_vector(data_width-1 downto 0);
		addr1,addr2 : in std_logic_vector(address_width-1 downto 0)
		);
end dual_port_memory;

--}} End of automatically maintained section

architecture dpm of dual_port_memory is	
	
	type memory is array ((2**address_width)-1 downto 0) of std_logic_vector(data_width-1 downto 0);
	shared variable ram : memory;
	
	signal data1_out : std_logic_vector(data_width-1 downto 0);
	signal data2_out : std_logic_vector(data_width-1 downto 0);
	
begin
	
	-- Memory Write Block 1
	-- Write Operation : When we1 = 1, cs1 = 1
	process (clk) 
	begin 
		if rising_edge(clk) then 
			if (cs1 = '1' and we1 = '1') then
				ram(to_integer(unsigned(addr1))) := data1;
			end if;
		end if;
	end process;
	
	-- Memory Write Block 2
	-- Write Operation : When we2 = 1, cs2 = 1
	process (clk) 
	begin 
		if rising_edge(clk) then 
			if (cs2 = '1' and we2 = '1') then
				ram(to_integer(unsigned(addr2))) := data2;
			end if;
		end if;
	end process;
	
	
	-- Tri-State Buffer control 1
	data1 <= data1_out when (cs1 = '1' and we1 = '0') else (others=>'Z');  
	
	-- Tri-State Buffer control 1
	data2 <= data2_out when (cs2 = '1' and we2 = '0') else (others=>'Z'); 
		
		
	
	-- Memory Read Block 1
	process (addr1, cs1, we1) begin
		if (cs1 = '1' and we1 = '0') then
			data1_out <= ram(to_integer(unsigned(addr1)));
		else
			data1_out <= (others=>'0');
		end if;
	end process; 
	
	-- Memory Read Block 2
	process (addr2, cs2, we2) begin
		if (cs2 = '1' and we2 = '0') then
			data2_out <= ram(to_integer(unsigned(addr2)));
		else
			data2_out <= (others=>'0');
		end if;
	end process;
	
end dpm;
