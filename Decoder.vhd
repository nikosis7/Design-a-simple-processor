----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:16:42 05/14/2017 
-- Design Name: 
-- Module Name:    Decoder - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Decoder is
    Port (Awr : in  STD_LOGIC_VECTOR (4 downto 0);
			 Registers : out STD_LOGIC_VECTOR (31 downto 0));
end Decoder;

architecture Behavioral of Decoder is

begin
	decode:
	for i in 0 to 31 generate 
		Registers(i)<= '1' when Awr = i else
							'0';
	end generate;
end Behavioral;


