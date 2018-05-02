-------------------------------------------------------------------------------
--
-- Title       : SevenSegmentDecoder
-- Design      : SevenSegmentDecoderDesign
-- Author      : Mohammad Doosti Lakhani
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : SevenSegmentDecoder.vhd
-- Generated   : Mon Apr  9 09:51:37 2018
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
--{entity {SevenSegmentDecoder} architecture {ssd}}

library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SevenSegmentDecoder is 
	port(
		sev_seg_out : out STD_LOGIC_VECTOR (7 downto 0);
		binary_input : in STD_LOGIC_VECTOR (3 downto 0)
);
end SevenSegmentDecoder;

--}} End of automatically maintained section

architecture ssd of SevenSegmentDecoder is
begin
	process(binary_input)
		
		begin
		
		case binary_input is
		
			when "0000" => sev_seg_out <= "00111111";
			
when "0001" => sev_seg_out <= "00000110";
			when "0010" => sev_seg_out <= "01011011";
			
when "0011" => sev_seg_out <= "01001111";
			
when "0100" => sev_seg_out <= "01100110";
			
when "0101" => sev_seg_out <= "01101101";
			
when "0110" => sev_seg_out <= "01111101";
			
when "0111" => sev_seg_out <= "00000111";
			
when "1000" => sev_seg_out <= "01111111";
			
when "1001" => sev_seg_out <= "01100111";
 
			
when "1010" => sev_seg_out <= "01110111";

			
when "1011" => sev_seg_out <= "01111100";

			
when "1100" => sev_seg_out <= "00111001";

			
when "1101" => sev_seg_out <= "01011110";

			
when "1110" => sev_seg_out <= "01111001";
			
when "1111" => sev_seg_out <= "01110001";


			when others => sev_seg_out <= "00000000";

		end case;
	
	end process;
	
end ssd;
