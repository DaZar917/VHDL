----------------------------------------------------------------------------------
-- Company:  DCI FEEI TUKE
-- Engineer: Norbert Ádám
-- 
-- Create Date: 20.09.2019 14:20:39
-- Design Name: 
-- Module Name: mx4_1_when_else - Behavioral
-- Project Name: lesson_03
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

entity mx4_1_when_else is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (1 downto 0);
           y : out STD_LOGIC);
end mx4_1_when_else;

architecture Behavioral of mx4_1_when_else is

begin

    y <= D(0) when S = "00" else
         D(1) when S = "01" else
         D(2) when S = "10" else
         D(3) when S = "11";

end Behavioral;
