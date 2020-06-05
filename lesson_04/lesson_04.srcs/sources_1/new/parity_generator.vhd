----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.10.2019 13:22:43
-- Design Name: 
-- Module Name: parity_generator - Behavioral
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

entity parity_generator is
    --
    generic(sel : natural := 0;     -- 0 = even parity, 1 = odd parity 
            width : natural := 8    -- data input (word) size
    );  
    Port ( D : in STD_LOGIC_VECTOR (width-1 downto 0);  -- data input
           parity : out STD_LOGIC                       -- parity bit
    );
end parity_generator;

architecture Behavioral of parity_generator is

begin

    --Use for-generate statement to design the "parity_generator" module

    EVEN : if sel = 0 generate
    --set the "parity" bit
    end generate;

    ODD : if sel = 1 generate
    -- set the "parity" bit
    end generate;

end Behavioral;


