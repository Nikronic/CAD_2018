-------------------------------------------------------------------------------
--
-- Title       : priorityEncoder
-- Design      : PriorityEncoderDesign
-- Author      : Mohammad Doosti Lakhani
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : priorityEncoder.vhd
-- Generated   : Mon Apr  9 09:22:56 2018
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
--{entity {priorityEncoder} architecture {pe}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity priorityEncoder is 
	port( a : in std_logic_vector(7 downto 0);
		z : out std_logic_vector(2 downto 0));
end priorityEncoder;

--}} End of automatically maintained section

architecture pe of priorityEncoder is
begin
	
	process(a)
	begin
		if a(7) = '1' then z<= "111";  
		else if a(6) = '1' then z<= "110";
			else if a(5) = '1' then z<= "101";
				else if a(4) = '1' then z<= "100";
					else if a(3) = '1' then z<= "011";
						else if a(2) = '1' then z<= "010";
							else if a(1) = '1' then z<= "001";
									if a(0) = '1' then z<= "000";
									end if;
								end if;
							end if;
						end if;
					end if;
				end if;
			end if;
		end if;
	end process;	
	
end pe;
