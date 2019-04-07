----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:09:02 05/14/2017 
-- Design Name: 
-- Module Name:    control - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Control is
	Port (Instr 			: in  STD_LOGIC_VECTOR (31 downto 0);
			InstrOut 		: out  STD_LOGIC_VECTOR (31 downto 0);
			ALU_Bin_Sel		: out  STD_LOGIC;	
			MEM_WrEn			: out  STD_LOGIC;	
			RF_WrData_Sel	: out  STD_LOGIC;	
			RF_WrEn			: out  STD_LOGIC;
			RF_B_Sel			: out  STD_LOGIC);
end Control;

architecture Behavioral of Control is

SIGNAL tempInstrOut	:	STD_LOGIC_VECTOR (31 downto 0);
SIGNAL tempALUSel		:	STD_LOGIC;	
SIGNAL tempMEM_En		:	STD_LOGIC;	
SIGNAL tempRF_WrSel	:	STD_LOGIC;	
SIGNAL tempRF_WrEn 	:	STD_LOGIC;
SIGNAL tempRF_BSel 	:	STD_LOGIC;

begin

process(Instr)
begin
		if(Instr(31 downto 26) = "111000") then --li
			tempALUSel		<= '1';
			tempInstrOut	<= Instr(31 downto 4) & "1111";
			tempMEM_En		<= '0';
			tempRF_WrSel	<= '1';
			tempRF_WrEn		<= '1';
			tempRF_BSel		<= '0';
		elsif(Instr(31 downto 26) = "001111") then --lw
			tempALUSel		<= '1';
			tempInstrOut	<= Instr(31 downto 4) & "0000";
			tempMEM_En	   <= '0';
			tempRF_WrSel	<= '0';
			tempRF_WrEn		<= '1';
			tempRF_BSel		<= '0';
		elsif(Instr(31 downto 26) = "011111") then --sw
			tempALUSel		<= '1';
			tempInstrOut	<= Instr(31 downto 4) & "0000";
			tempMEM_En		<= '1';
			tempRF_WrSel	<= '0';
			tempRF_WrEn		<= '0';
			tempRF_BSel		<= '1';
		elsif(Instr(31 downto 26) = "100000" OR Instr(31 downto 26) = "110000" OR Instr(31 downto 26) = "110010" OR Instr(31 downto 26) = "110011") then --add,sub,and,not,or,shr,shl,rol,ror
			if(Instr(31 downto 26) = "110000" OR Instr(31 downto 26) = "110010" OR Instr(31 downto 26) = "110011")then	--addi,andi,ori
				tempALUSel		<= '1';
			else
				tempALUSel		<= '0';
			end if;
			if(Instr(31 downto 26) = "100000" AND Instr(3 downto 0)= "1000") then		-- shr
				tempInstrOut	<= Instr(31 downto 4) & "1001";
			elsif(Instr(31 downto 26) = "100000" AND Instr(3 downto 0)= "1001") then	-- shl
				tempInstrOut	<= Instr(31 downto 4) & "1010";
			elsif(Instr(31 downto 26) = "110000")then
				tempInstrOut	<= Instr(31 downto 4) & "0000";	-- addi
			elsif(Instr(31 downto 26) = "110000")then
				tempInstrOut	<= Instr(31 downto 4) & "0010";	-- andi
			elsif(Instr(31 downto 26) = "110000")then
				tempInstrOut	<= Instr(31 downto 4) & "0011";	--	ori
			else
				tempInstrOut	<= Instr;
			end if;
			tempMEM_En		<= '0';
			tempRF_WrSel	<= '1';
			tempRF_WrEn		<= '1';
			tempRF_BSel		<= '0';
		else
			tempALUSel		<= '0';
			tempInstrOut	<= (others => '0');
			tempMEM_En		<= '0';
			tempRF_WrSel	<= '0';
			tempRF_WrEn		<= '0';
			tempRF_BSel		<= '0';
		end if;
		
end process;

		ALU_Bin_Sel		<= tempALUSel;
		InstrOut			<= tempInstrOut;
		MEM_WrEn			<= tempMEM_En;
		RF_WrData_Sel	<= tempRF_WrSel;
		RF_WrEn			<= tempRF_WrEn;
		RF_B_Sel			<= tempRF_BSel;

end Behavioral;

