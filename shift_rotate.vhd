----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:26:17 05/14/2017 
-- Design Name: 
-- Module Name:    shift_rotate - Behavioral 
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

entity shift_rotate is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           Op : in  STD_LOGIC_VECTOR (3 downto 0);
           O : out  STD_LOGIC_VECTOR (31 downto 0));
end shift_rotate;

architecture Behavioral of shift_rotate is

begin
	O(31) <= A(31) when (Op = "1000") else --shift right arithmetic
				'0'   when (Op = "1001") else --shift right logical
				A(30) when (Op = "1010") else --shift left logical 
				A(30) when (Op = "1100") else --rotate left
				A(0)  when (Op = "1101");		--rotate right
	O(30 downto 1) <= A(31 downto 2) when (Op = "1000") else --shift right arithmetic
							A(31 downto 2) when (Op = "1001") else --shift right logical
							A(29 downto 0) when (Op = "1010") else --shift left logical 
							A(29 downto 0) when (Op = "1100") else --rotate left
							A(31 downto 2) when (Op = "1101");		--rotate right
	O(0) <= A(1)  when (Op = "1000") else --shift right arithmetic
			  A(1)  when (Op = "1001") else --shift right logical
			  '0'   when (Op = "1010") else --shift left logical 
			  A(31) when (Op = "1100") else --rotate left
			  A(1)  when (Op = "1101");		 --rotate right

end Behavioral;

