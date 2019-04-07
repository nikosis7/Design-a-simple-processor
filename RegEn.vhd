----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:24:23 05/14/2017 
-- Design Name: 
-- Module Name:    RegEn - Behavioral 
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

entity Reg is
    Port ( CLK : in  STD_LOGIC;
           Din : in  STD_LOGIC_VECTOR (31 downto 0);
           WE : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end Reg;

architecture Behavioral of Reg is

begin
	process (CLK)
	begin
			if WE = '1' AND (CLK'event AND CLK = '1')then
				Dout <= Din ;
			end if;
	end process;

end Behavioral;