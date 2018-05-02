-------------------------------------------------------------------------------
--
-- Title       : counterEightBit
-- Design      : CounterDesign
-- Author      : Mohammad Doosti Lakhani
-- Student ID  : 94012269021
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : counterEightBit.vhd
-- Generated   : Fri Apr 27 12:44:58 2018
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : An 8 bits counter which counts to maximum 207 and start again from zero and has reset.
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {counterEightBit} architecture {ceb}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_signed.all;

entity counterEightBit is 
	port(
		Clk : in std_logic;
		CountEn : in std_logic;
		Output : out std_logic_vector(7 downto 0));
end counterEightBit;

--}} End of automatically maintained section

architecture ceb of counterEightBit is
signal NextNum : std_logic_vector(7 downto 0):= "00000000";
signal CurrentNum : std_logic_vector(7 downto 0) := "00000000";

begin
	process(CurrentNum)
	begin
		if(CurrentNum = "11001111") then NextNum <= "00000000";
		else NextNum <= CurrentNum+1;
		end if;
	end process;  
	
	process(Clk,CountEn)
	begin	
		if (CountEn = '0') then CurrentNum <= "00000000";
		elsif(rising_edge(Clk)) then
			CurrentNum <= NextNum;
		end if;
	end process;
	Output <= currentNum;
	
end ceb;
