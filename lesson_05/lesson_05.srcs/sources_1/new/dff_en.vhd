----------------------------------------------------------------------------------
-- Company:  DCI FEEI TUKE
-- Engineer: Norbert Ádám
-- 
-- Create Date: 14.10.2019 15:47:31
-- Design Name: 
-- Module Name: dff_en - Behavioral 
-- Project Name: lesson_05
-- Target Devices: xc7a35tcpg236-1
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

entity dff_en is
    Port ( clk  : in  STD_LOGIC;
           rst  : in  STD_LOGIC; 
           d    : in  STD_LOGIC;
           en   : in  STD_LOGIC; 
           q    : out  STD_LOGIC);
end dff_en;

architecture Behavioral of dff_en is

begin

    DFF_UP_RST_EN: process(clk) is
    begin	
        if rising_edge(clk) then
            if (rst = '1') then
                q <= '0';
            elsif en = '1' then
                q <= d;
            end if;            
        end if;
    end process;

end Behavioral;

