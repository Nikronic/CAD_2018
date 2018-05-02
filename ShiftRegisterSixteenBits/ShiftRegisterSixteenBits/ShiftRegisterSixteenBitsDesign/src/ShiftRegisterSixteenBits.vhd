-------------------------------------------------------------------------------
--
-- Title       : ShiftRegisterSixteenBits
-- Design      : ShiftRegisterSixteenBitsDesign
-- Author      : Mohammad Doosti Lakhani
-- Student ID  : 94012269021
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : ShiftRegisterSixteenBits.vhd
-- Generated   : Fri Apr 27 18:41:31 2018
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : A 16 bits register which have Shift left, Shift right, Load and Reset.
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {ShiftRegisterSixteenBits} architecture {srsb}}

library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use ieee.numeric_std.all;

entity ShiftRegisterSixteenBits is 
	port(
		Clk : in std_logic;
		Reset : in std_logic;
		Load : in std_logic;
		ShR : in std_logic;
		ShL : in std_logic;
		DataIn : in std_logic_vector(15 downto 0);
		Output : out std_logic_vector(15 downto 0));
end ShiftRegisterSixteenBits;

--}} End of automatically maintained section

architecture srsb of ShiftRegisterSixteenBits is
	signal z : std_logic_vector(15 downto 0); 
	signal out_temp : std_logic_vector(15 downto 0);
	
begin
	Process(DataIn, ShR, ShL, Load)
	begin
		if (load = '1') then z<= DataIn;
		elsif (ShR = '1' and ShL = '0') then z<= std_logic_vector(shift_left(unsigned(z),1)); 
		elsif (ShR = '0' and ShL = '1') then z<= std_logic_vector(shift_right(unsigned(z),1));
		elsif (ShR = '0' and ShL = '0') then z<= out_temp;
			else z <= "0000000000000000";
		end if;
	end process;
	
	
	process(Clk,Reset)
	begin
		if (Reset = '1') then Output <= "0000000000000000";
		elsif (rising_edge(Clk)) then Output<= z; out_temp<=z;
		end if;
	end process;
end srsb;
