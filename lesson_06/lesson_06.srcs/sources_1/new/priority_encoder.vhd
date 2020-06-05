----------------------------------------------------------------------------------
-- Company:  DCI FEEI TUKE
-- Engineer: Norbert √?d√°m
-- 
-- Create Date: 03.10.2019 14:17:59
-- Design Name: 
-- Module Name: priority_encoder - Behavioral
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- The output of a priority encoder is the binary representation 
-- of the position of the most significant bit in original number. 
-- Position 0 represents the position of the least (right-most) significant bit.
-- Position n represents the position of the most (left-most) significant bit. 
-- If two or more inputs are given at the same time, the input 
-- having the highest priority will take precedence.

-- An example of a single bit 4 to 2 priority encoder is shown, 
-- where highest-priority inputs are to the left and "x" indicates 
-- do not care value - i.e. any input value there yields the same 
-- output since it is superseded by higher-priority input. 
-- The output v indicates if the input is valid.
--    D     Y   v 
--  0000    00  0
--  0001    00  1
--  001x    01  1
--  01xx    10  1
--  1xxx    11  1
       
entity priority_encoder is
    generic ( width : positive := 3);
    Port ( D : in STD_LOGIC_VECTOR (width**2-1 downto 0);
           Y : out STD_LOGIC_VECTOR (width-1 downto 0);
           v : out STD_LOGIC);
end priority_encoder;

architecture Behavioral of priority_encoder is

begin

    process(D)
        variable OneHot : integer := 0;
    begin            
    
        Y <= (others => '0');
        if unsigned(D) > 0 then
            for i in width**2-1 downto 0 loop
                OneHot := i;
                exit when D(i) = '1';                         
            end loop;

            Y <= std_logic_vector(to_unsigned(OneHot, width));    
            v <= '1';    
        else
            v <= '0';
        end if;                   
    end process;
  
end Behavioral;
