-------------------------------------------------------------------------------
--
-- Title       : Arithmatic
-- Design      : ArithmaticDesign
-- Author      : Mohammad Doosti Lakhani
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : Arithmatic.vhd
-- Generated   : Mon Apr  9 09:34:55 2018
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {Arithmatic} architecture {a}}

library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity Arithmatic is
	port(input : in std_logic_vector(7 downto 0);
		sign_bit : in std_logic;
		unsigned_output : out std_logic_vector(8 downto 0);
		ones : out std_logic_vector(8 downto 0);
		twos : out std_logic_vector(8 downto 0));
end Arithmatic;

--}} End of automatically maintained section

architecture a of Arithmatic is
begin
	
	process(sign_bit,input)
	begin
		unsigned_output <= '0'&input;
		if (sign_bit = '0') then 
			ones <= '0'&input;
			twos <= '0'&input;
		else if (sign_bit = '1') then
				ones <= sign_bit&not(input);
				twos <= (sign_bit&not(input)) +1;  
			end if;
		end if;
	end process;
	
end a;
