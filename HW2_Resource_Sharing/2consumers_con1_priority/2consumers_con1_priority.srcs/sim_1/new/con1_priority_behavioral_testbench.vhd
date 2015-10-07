
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:36:18 09/30/2015
-- Design Name:   arbiter_struct_2cons
-- Module Name:   C:/Xilinx92i/bin/nt/EECS_645/Q1_TestBench.vhd
-- Project Name:  EECS_645
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: arbiter_struct_2cons
--
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends 
-- that these types always be used for the top-level I/O of a design in order 
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY arbiter_bahav_2cons_tb IS
END arbiter_bahav_2cons_tb; 

ARCHITECTURE behavior OF arbiter_bahav_2cons_tb IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT arbiter_bahav_2cons 
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		REQ_01 : IN std_logic;
		REQ_02 : IN std_logic;          
		ACK_01 : OUT std_logic;
		ACK_02 : OUT std_logic
		);
	END COMPONENT;

	--Inputs
	SIGNAL clk :  std_logic := '0';
	SIGNAL rst :  std_logic := '0';
	SIGNAL REQ_01 :  std_logic := '0';
	SIGNAL REQ_02 :  std_logic := '0';

	--Outputs
	SIGNAL ACK_01 :  std_logic;
	SIGNAL ACK_02 :  std_logic;
	
	--clk period from example
	constant clk_period : time := 10ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: arbiter_bahav_2cons PORT MAP(
		ACK_01 => ACK_01,
		ACK_02 => ACK_02,
		clk => clk,
		rst => rst,
		REQ_01 => REQ_01,
		REQ_02 => REQ_02
	);

	clk_process : PROCESS
	BEGIN

		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		
	END PROCESS;
	
	--stim
	 
	 stim_process: process
	 begin
		
		rst <= '1';
		wait for clk_period*3;
		
		rst <= '0';
		wait for clk_period*3;
		
		REQ_01 <= '1';
		REQ_02 <= '1';
		wait for clk_period*3;
		
		REQ_01 <= '1';
		REQ_02 <= '0';
		wait for clk_period*3;
		
		REQ_01 <= '1';
		REQ_02 <= '1';
		wait for clk_period*3;
		
		REQ_01 <= '0';
		REQ_02 <= '1';
		wait for clk_period*3;
		
		REQ_01 <= '1';
		REQ_02 <= '1';
		wait for clk_period*3;
		
		REQ_01 <= '1';
		REQ_02 <= '0';
		wait for clk_period*3;
		
		REQ_01 <= '1';
		REQ_02 <= '1';
		wait for clk_period*3;
		
		REQ_01 <= '0';
		REQ_02 <= '0';
		wait for clk_period*3;
		
		REQ_01 <= '0';
		REQ_02 <= '1';
		wait for clk_period*3;
		
		rst <= '1';
		wait for clk_period*3;
		
		rst <= '0';
		wait for clk_period*3;
		
		wait;
	end process;
END;