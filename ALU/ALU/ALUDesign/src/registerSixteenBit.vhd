-------------------------------------------------------------------------------
--
-- Title       : registerSixteenBit
-- Design      : ALUDesign
-- Author      : Mohammad Doosti Lakhani
-- Student ID  : 94012269021
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : registerSixteenBit.vhd
-- Generated   : Wed Apr 25 22:49:42 2018
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : A 16 bits register
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {registerSixteenBit} architecture {rsb}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity registerSixteenBit is 
	port (
		i : in std_logic_vector(15 downto 0);
		l : in std_logic;
		clr : in std_logic;
		clk : in std_logic;
		o : out std_logic_vector(15 downto 0));
end registerSixteenBit;

--}} End of automatically maintained section

architecture rsb of registerSixteenBit is	  
begin
	process(clk,clr)
	begin
		if (clr = '1') then 
			o <= "0000000000000000";
		elsif (rising_edge(clk)) then 
			if ( l = '1') then 
				o <= i;
			end if;
		end if;
	end process;
	
end rsb;
