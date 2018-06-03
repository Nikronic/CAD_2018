-------------------------------------------------------------------------------
--
-- Title       : dma
-- Design      : DMA_design
-- Author      : Mohammad Doosti Lakhani
-- Student ID  : 94012269021
--
-------------------------------------------------------------------------------
--
-- File        : dma.vhd
-- Generated   : Sun May 27 20:10:12 2018
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : A DMA with copy feature from destination address to target address and finish job flag.
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {dma} architecture {a}}


library IEEE;
use IEEE.STD_LOGIC_1164.all;   
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity dma is
	generic (data_width,address_width : integer := 8);
	port (
		clock : in std_logic;
		start : in std_logic;
		finish : out std_logic := '0';
		addrSource : in std_logic_vector(address_width-1 downto 0);
		addrDest : in std_logic_vector(address_width-1 downto 0);
		copySize : in std_logic_vector(address_width-1 downto 0)
		);
end dma;

--}} End of automatically maintained section

architecture a of dma is	
	signal transdata : std_logic_vector(data_width-1 downto 0);
	signal temp : std_logic_vector(data_width-1 downto 0);
	signal counter : std_logic_vector(address_width-1 downto 0) := (others => '0');	
	signal addrDestination : std_logic_vector(address_width-1 downto 0);
	signal initializing : std_logic := '1';
	
	
	component dual_port_memory
		generic (data_width,address_width : integer := 8);
		port (
			clk,cs1,we1,cs2,we2 : in std_logic;
			data1,data2 : inout std_logic_vector(data_width-1 downto 0);
			addr1,addr2 : in std_logic_vector(address_width-1 downto 0)
			);
	end component;
	
	
begin
	readsess : dual_port_memory generic map (data_width,address_width => 8)
	port map(clock,'1','0','1','1',temp,transdata,addrSource,addrDestination);
	
	
	process(clock)
	begin
		if start = '0' then
			counter <= (others => '0');
			finish <= '0';
			transdata <= "11101110";
			addrDestination <= x"ff";
			initializing <= '0';
		elsif rising_edge(clock) then
			if start = '1' then
				if counter < copysize then
					addrDestination <= addrDest+counter;
					counter <= counter+1;
					transdata <= temp;
				else finish <= '1';
				end if;
			end if;
		end if;
	end process;
	
	
end a;
