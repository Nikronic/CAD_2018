-------------------------------------------------------------------------------
--
-- Title       : alu
-- Design      : ALUDesign
-- Author      : Mohammad Doosti Lakhani
-- Student ID  : 94012269021
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : alu.vhd
-- Generated   : Wed Apr 25 19:21:37 2018
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : An inplementation of 16bits ALU which do this operations: ADD, INC, SUB, NOT, AND, OR, XOR, SLL (shift left)
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {alu} architecture {a}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity alu is 
	port (	   
		Clk : std_logic;
		Ain : in signed(15 downto 0);
		Bin : in signed(15 downto 0);
		Control : in std_logic_vector(2 downto 0);
		ALUEn : in std_logic;
		Output : out signed(15 downto 0));
end alu;

--}} End of automatically maintained section

architecture a of alu is  
signal z : std_logic_vector(15 downto 0);
signal out_temp : signed(15 downto 0);

	component registerSixteenBit
		port (
			i : in std_logic_vector(15 downto 0);
			l : in std_logic;
			clr : in std_logic;
			clk : in std_logic;
			o : out std_logic_vector(15 downto 0));
	end component;	
		
begin
	process(Ain,Bin,Control,ALUEn)
	begin
		case Control is 
			when "000" => out_temp <= Ain+Bin; -- add
			when "001" => out_temp <= Ain+1; -- inc
			when "010" => out_temp <= Ain-Bin; -- sub
			when "011" => out_temp <= not Ain; -- not
			when "100" => out_temp <= Ain and Bin; -- and
			when "101" => out_temp <= Ain or Bin; -- or
			when "110" => out_temp <= Ain xor Bin; -- xor
			when "111" => out_temp <= shift_left(Ain,to_integer(Bin)); -- sll	   
			when others => out_temp <= "0000000000000000"; 
		end case;
		 -- Output <= out_temp;
	end process;
	
		
	reg : registerSixteenBit port map (std_logic_vector(out_temp), ALUEn,'0',Clk,z);
	Output <= signed(z);
end a;
