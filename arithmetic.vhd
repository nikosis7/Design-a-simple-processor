----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:13:59 05/14/2017 
-- Design Name: 
-- Module Name:    arithmetic - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity arithmetic is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Op : in  STD_LOGIC_VECTOR (3 downto 0);
			  O : out  STD_LOGIC_VECTOR (31 downto 0);
           Cout : out  STD_LOGIC;
           Ovf : out  STD_LOGIC);
end arithmetic;

architecture Behavioral of arithmetic is
signal tempB : STD_LOGIC_VECTOR (31 downto 0);
signal carry : STD_LOGIC_VECTOR (32 downto 0);
signal sig 	 : STD_LOGIC_VECTOR (31 downto 0);
Component fulladder is
	 Port ( X : in  STD_LOGIC;
           Y : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           S : out  STD_LOGIC;
           Carryout : out  STD_LOGIC);
end Component;
begin

tempB <= B when Op = "0000" else
		STD_LOGIC_VECTOR(UNSIGNED((NOT B) + '1')) when Op = "0001";

carry(0) <= '0';

GenerateLabel:
	for i in 0 to 31 generate
	RCA: fulladder Port Map(X			=> A(i),
									Y 			=> tempB(i),
									Cin 		=> carry(i),
									S 			=> sig(i),
									Carryout	=> carry(i+1)); 
	end generate;
Cout <= carry(32);
O	  <= sig;

Ovf <= '1' when ((A(31)=tempB(31)) AND (tempB(31)/=sig(31))) else
		 '0' ;

end Behavioral;
