----------------------------------------------------------------------------------
-- Company:  DCI FEEI TUKE
-- Engineer: Norbert √?d√°m
-- 
-- Create Date: 03.10.2019 14:17:59
-- Design Name: 
-- Module Name: one_hot_encoder - Behavioral
-- Project Name: lesson_06
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
use IEEE.NUMERIC_STD.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- The output of a one-hot encoder is the binary representation derived from the original number 
-- by preserved only the most (left-most) significant input bit. If two or more inputs are given 
-- at the same time, the input having the highest priority will take precedence.

-- An example of a single bit 4 to 4 one-hot priority encoder is shown, 
-- where highest-priority inputs are to the left and "x" indicates 
-- do not care value - i.e. any input value there yields the same 
-- output since it is superseded by higher-priority input. 
-- The output v indicates if the input is valid.
--    D     Y       v 
--  0000    0000    0
--  0001    0001    1
--  001x    0010    1
--  01xx    0100    1
--  1xxx    1000    1

entity one_hot_encoder is
    generic ( width : natural := 4);
    Port ( D : in STD_LOGIC_VECTOR (width-1 downto 0);
           Y : out STD_LOGIC_VECTOR (width-1 downto 0);
           v : out STD_LOGIC);
end one_hot_encoder;

architecture Behavioral of one_hot_encoder is

begin

    process(D)
        variable OneHot : integer := 0;
    begin        
        Y <= (others => '0');
        if unsigned(D) > 0 then
            for i in width-1 downto 0 loop
                OneHot := i;
                exit when D(i) = '1';                         
            end loop;
            Y(OneHot) <= '1';
            v <= '1';    
        else
            v <= '0';
        end if;        
    end process;

end Behavioral;
