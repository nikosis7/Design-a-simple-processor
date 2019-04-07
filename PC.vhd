----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:22:38 05/14/2017 
-- Design Name: 
-- Module Name:    PC - Behavioral 
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

entity PC is
	port (Din 			: in std_logic_vector(31 downto 0); -- system inputs
			PC_LdEn 		: in std_logic; -- enable
			Clk, Reset 	: in std_logic; -- clock and reset 
			Dout 			: out std_logic_vector(31 downto 0)); -- system outputs
end PC;

architecture Behavioral of PC is

begin

process(Clk,Reset)
begin -- process
	-- activities triggered by asynchronous reset (active high)
	if Reset = '1' then     
		Dout <= (others=>'0');
	-- activities triggered by rising edge of clock
	elsif (PC_LdEn='1' and Clk'event and Clk = '1') then
		Dout <= Din;
	end if;
end process;

end Behavioral;

