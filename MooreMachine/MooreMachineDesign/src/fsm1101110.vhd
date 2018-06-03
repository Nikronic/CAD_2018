-------------------------------------------------------------------------------
--
-- Title       : fsm1101110
-- Design      : MooreMachineDesign
-- Author      : Mohammad Doosti Lakhani
-- Student ID  : 94012269021
--
-------------------------------------------------------------------------------
--
-- File        : fsm1101110.vhd
-- Generated   : Wed May 23 15:53:41 2018
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : An Moore FSM which detect "1101110" string in any one bit input sequence. (2 process)
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {fsm1101110} architecture {fsm}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity fsm1101110 is port (
	input : in std_logic;
	clk : in std_logic;
	reset : in std_logic;
	output : out std_logic);
end fsm1101110;

--}} End of automatically maintained section

architecture fsm of fsm1101110 is 

type state is (s0,s1,s2,s3,s4,s5,s6,s7); -- s0 = start  ,  s7= finish
signal current_state, next_state : state;

begin		
	
	-- combinational process
	process(input,current_state)
	begin
		case current_state is 
			when s0 => if input = '1' then next_state <= s1; else next_state <= current_state; end if;
			when s1 => if input = '1' then next_state <= s2; else next_state <= s0; end if;
			when s2 => if input = '0' then next_state <= s3; else next_state <= current_state; end if;
			when s3 => if input = '1' then next_state <= s4; else next_state <= s0; end if;
			when s4 => if input = '1' then next_state <= s5; else next_state <= s0; end if;
			when s5 => if input = '1' then next_state <= s6; else next_state <= s3; end if;
			when s6 => if input = '0' then next_state <= s7; else next_state <= s2; end if;
			when s7 => if input ='0' then next_state <= s0; else next_state <= s4; end if;
			when others => next_state <= s0;
		end case;
	end process; 
	
	
	-- sequential process
	process(clk, reset)
	begin
		if reset = '1' then 
			current_state <= s0;
		elsif rising_edge(clk) then 
			current_state <= next_state;
		end if;
	end process; 
	
	-- output process
	output <= '1' when current_state = s7 else '0';
	
end fsm;
