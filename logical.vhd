----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:20:28 05/14/2017 
-- Design Name: 
-- Module Name:    logical - Behavioral 
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

entity logical is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Op : in  STD_LOGIC_VECTOR (3 downto 0);
           O : out  STD_LOGIC_VECTOR (31 downto 0));
end logical;

architecture Behavioral of logical is

begin

	O<=(A AND B) when (Op="0010") else	-- logic "AND"
		(A OR B)	 when	(Op="0011") else	-- logic "OR"
		(NOT A)	 when (Op="0100");		-- 
		
end Behavioral;

