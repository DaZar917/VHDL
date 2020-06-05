----------------------------------------------------------------------------------
-- Company:  DCI FEEI TUKE
-- Engineer: Norbert Ádám
-- 
-- Create Date: 14.10.2019 15:57:11
-- Design Name: 
-- Module Name: mx4_1_case - Behavioral
-- Project Name: lesson_05
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

entity mx4_1_case is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
       S : in STD_LOGIC_VECTOR (1 downto 0);
       y : out STD_LOGIC);
end mx4_1_case;

architecture Behavioral of mx4_1_case is

begin

    process (D,S) 
    begin
        case S is
            when "00" => y <= D(0);
            when "01" => y <= D(1);
            when "10" => y <= D(2);
            when "11" => y <= D(3);
            when others => null;
        end case;               
    end process;

end Behavioral;
