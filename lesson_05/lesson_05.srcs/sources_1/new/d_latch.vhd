----------------------------------------------------------------------------------
-- Company:  DCI FEEI TUKE
-- Engineer: Norbert Ádám
-- 
-- Create Date: 14.10.2019 15:47:27
-- Design Name: 
-- Module Name: d_latch - Behavioral
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

entity d_latch is
    Port ( d    : in STD_LOGIC;
           en   : in STD_LOGIC;
           q    : out STD_LOGIC);
end d_latch;

architecture Behavioral of d_latch is

begin

    DFF_LATCH_EN: process(d, en) is
    begin	
        if (en = '1') then
            q <= d;
        end if;            
    end process;

end Behavioral;
