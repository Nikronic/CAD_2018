-------------------------------------------------------------------------------
--
-- Title       : itr
-- Design      : InertialTransportRejectDesign
-- Author      : Mohammad Doosti Lakhani
-- Student ID  : 94012269021
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : itr.vhd
-- Generated   : Thu Apr 26 23:36:27 2018
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : A program which tests these three commands : inertial, trasport, reject
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {itr} architecture {arc}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity itr is 
	port(
		qin : in std_logic;
		Y1 : out std_logic;
		Y2 : out std_logic;
		Y3 : out std_logic;
		Y4 : out std_logic;
		Y5 : out std_logic);
end itr;

--}} End of automatically maintained section

architecture arc of itr is
begin
	Y1 <= qin;
	Y2 <= qin after 1ns;
	Y3 <= inertial qin after 1ns;
	Y4 <= transport qin after 1ns;
	Y5 <= reject 500ps inertial qin after 1ns;
end arc;
