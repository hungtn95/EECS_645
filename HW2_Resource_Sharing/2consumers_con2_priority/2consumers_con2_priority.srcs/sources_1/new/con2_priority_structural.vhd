----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:35:16 09/30/2015 
-- Design Name: 
-- Module Name:    Q1_Structural - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity arbiter_struct_2cons  is
	port(
		REQ_01	:	IN		std_logic;
		REQ_02	:	IN		std_logic;
		clk		:	IN		std_logic;
		rst		:	IN		std_logic;
		ACK_01	:	OUT	std_logic;
		ACK_02	:	OUT	std_logic
	);
end arbiter_struct_2cons;

architecture struct_con2_priority of arbiter_struct_2cons is
	signal s1_current, s2_current	: std_logic;
	signal s1_next	  , s2_next		: std_logic;
begin
	memory_elements : process(clk, rst)
	begin
		if (rst = '1') then
			s1_current <= '0';
			s2_current <= '0';
		elsif (clk'EVENT and clk = '1') then
			s1_current <= s1_next;
			s2_current <= s2_next;
		end if;
	end process memory_elements;

	s1_next <= (REQ_01 and (not s2_current));
	s2_next <= ((not REQ_01) and REQ_02 and (not s1_current)) or 
               (REQ_02 and (not s1_current) and s2_current);
	ACK_01 <= (s1_current and (not s2_current));
	ACK_02 <= ((not s1_current) and s2_current);
end struct_con2_priority;