----------------------------------------------------------------------------------
-- Company:  DCI FEEI TUKE
-- Engineer: Norbert Ádám
-- 
-- Create Date: 24.09.2019 19:54:40
-- Design Name: 
-- Module Name: mult_6x6s_5x5u - Behavioral
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
library UNISIM;
use UNISIM.VComponents.all;

entity mult_6x6s_5x5u is
    Port ( A6s, B6s : in STD_LOGIC_VECTOR (5 downto 0);
           A5u, B5u : in STD_LOGIC_VECTOR (4 downto 0);
           P6s : out STD_LOGIC_VECTOR (11 downto 0);    -- Result in twos complement
           P5u : out STD_LOGIC_VECTOR (9 downto 0));
end mult_6x6s_5x5u;

architecture Structural of mult_6x6s_5x5u is

    signal A, B : std_logic_vector(17 downto 0);
    signal P : std_logic_vector(35 downto 0);

begin

    A(17 downto 12) <= A6s;
    A(11 downto 5) <= (others => '0');
    A(4 downto 0) <= A5u;
    
    B(17 downto 12) <= B6s;
    B(11 downto 5) <= (others => '0');
    B(4 downto 0) <= B5u;

    -- MULT18X18: 18 x 18 signed asynchronous multiplier
    MULT18X18_inst : MULT18X18 port map (
        P => P, -- 36-bit multiplier output
        A => A, -- 18-bit multiplicand input
        B => B -- 18-bit multiplier input
    );

    P6s <= P(35 downto 24);
    P5u <= P(9 downto 0);

end Structural;
