----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:40:00 09/30/2015 
-- Design Name: 
-- Module Name:    Q1VHDFSM - Behavioral 
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

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity arbiter_bahav_2cons is
    Port ( ACK_01 : out  STD_LOGIC;
           ACK_02 : out  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           REQ_01 : in  STD_LOGIC;
           REQ_02 : in  STD_LOGIC);
end arbiter_bahav_2cons; 

architecture behav_con2_priority of arbiter_bahav_2cons is

	--replicating from example----------------------

	subtype state_type is std_logic_vector (1 downto 0);
	
	constant NoAccess: state_type := "00";
	constant User1Access: state_type := "10";
	constant User2Access: state_type := "01";
	constant UnusedState: state_type := "11";
	
	signal CurrentState: state_type;
	signal NextState: state_type;
	
	signal ReqVec: std_logic_vector(1 downto 0); -- Experimenting
	
	------------------------------------------------

begin
	
	ReqVec <= (REQ_01, REQ_02);
	
	-- Replicated from Example code---------------
	memory_elements:process(clk, rst)
	begin
		if(rst='1') then
			CurrentState <= NoAccess;
		elsif (clk'EVENT and clk = '1') then
			CurrentState <= NextState;
		end if;
	end process memory_elements;
	----------------------------------------------
	
	state_logic: process (ReqVec, CurrentState)
	begin
		case CurrentState is
		when NoAccess =>
			NextState <= NoAccess;
			if (ReqVec = "10") then
				NextState <= User1Access;
			end if;
			if (ReqVec = "01" or ReqVec = "11") then
				NextState <= User2Access;
			end if;
		when User1Access =>
			NextState <= User1Access;
			if (ReqVec(1) = '0') then
				NextState <= NoAccess;
			end if;
		when User2Access =>
			NextState <= User2Access;
			if (ReqVec(0) = '0') then
				NextState <= NoAccess;
			end if;
		when others =>
			NextState <= NoAccess;
		end case;
	end process state_logic; 
	
	output_logic: process (CurrentState)
	begin
		case CurrentState is
		when User1Access =>
			ACK_01 <= '1';
			ACK_02 <= '0';
		when User2Access =>
			ACK_01 <= '0';
			ACK_02 <= '1';
		when others =>
			ACK_01 <= '0';
			ACK_02 <= '0';
		end case;
	end process output_logic;
	
end behav_con2_priority;

