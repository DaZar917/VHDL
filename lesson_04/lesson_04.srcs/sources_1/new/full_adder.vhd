----------------------------------------------------------------------------------
-- Company:  DCI FEEI TUKE
-- Engineer: Norbert Ádám
-- 
-- Create Date: 24.09.2019 13:30:04
-- Design Name: 
-- Module Name: full_adder - Behavioral
-- Project Name: lesson_04
-- Target Devices: xc7a35tcpg236-1
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity full_adder is
    Port ( a, b, c : in STD_LOGIC;
           sum : out STD_LOGIC;
           carry : out STD_LOGIC);
end full_adder;

architecture Behavioral of full_adder is

begin

	sum <= (a xor b) xor c;
	carry <= (a and b) or ((a xor b) and c);

end Behavioral;
