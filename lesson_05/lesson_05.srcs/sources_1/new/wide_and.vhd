----------------------------------------------------------------------------------
-- Company:  DCI FEEI TUKE
-- Engineer: Norbert Ádám
-- 
-- Create Date: 14.10.2019 15:56:47
-- Design Name: 
-- Module Name: wide_and - Behavioral
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

entity wide_and is
    generic (width : positive := 32);                       -- data input size
    Port ( Data : in STD_LOGIC_VECTOR (width-1 downto 0);   
           y : out STD_LOGIC);                              
end wide_and;

architecture Behavioral of wide_and is

begin

    process (Data) is
        variable tmp : std_logic;
    begin    
        tmp := Data(0);
        for i in 1 to width-1 loop
            tmp := tmp and Data(i);
        end loop;
        y <= tmp;
    end process;

end Behavioral;
