----------------------------------------------------------------------------------
-- Company:  DCI FEEI TUKE
-- Engineer: Norbert Ádám
-- 
-- Create Date: 08.10.2019 12:39:24
-- Design Name: 
-- Module Name: clock_divider - Behavioral
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

entity clock_divider is
    generic (divider : natural := 100_000_000); -- 1 pulse in every one second
    Port ( sys_clk : in STD_LOGIC;              -- The base frequency for Basys 3 board (xc7a35tcpg236-1 chip) is 100 MHz 
           rst : in STD_LOGIC;
           clk : out STD_LOGIC);
end clock_divider;

architecture Behavioral of clock_divider is
    signal internal_clock : std_logic;
begin

    process (rst, sys_clk)
        variable clk_divider : natural;
    begin
        if (rst = '1') then
            clk_divider := 0;
            internal_clock <= '0';
        elsif(rising_edge(sys_clk)) then
            if (clk_divider < (divider / 2)) then
                clk_divider := clk_divider + 1;
                internal_clock <= '0';
            elsif (clk_divider = divider-1) then
                clk_divider := 0;
                internal_clock <= '1';
            else
                clk_divider := clk_divider + 1;
                internal_clock <= '1';
            end if;
        end if;
    end process;
    
    clk <= internal_clock;
        
end Behavioral;

---- source: https://surf-vhdl.com/how-to-implement-clock-divider-vhdl/
--architecture Behavioral of clock_divider is
--    signal r_clk_counter        : unsigned(7 downto 0);
--    signal r_clk_divider        : unsigned(7 downto 0);
--    signal r_clk_divider_half   : unsigned(7 downto 0);
--begin

--    p_clk_divider: process(rst,sys_clk)
--    begin
--      if(rst='1') then
--        r_clk_counter       <= (others=>'0');
--        r_clk_divider       <= (others=>'0');
--        r_clk_divider_half  <= (others=>'0');
--        clk                 <= '0';
--      elsif(rising_edge(sys_clk)) then
--        r_clk_divider      <= to_unsigned(divider, r_clk_divider'length)-1;
--        r_clk_divider_half <= to_unsigned(divider/2, r_clk_divider_half'length); -- half
--        if(r_clk_counter < r_clk_divider_half) then 
--          r_clk_counter <= r_clk_counter + 1;
--          clk           <= '0';
--        elsif(r_clk_counter = r_clk_divider) then
--          r_clk_counter <= (others=>'0');
--          clk           <= '1';
--        else
--          r_clk_counter <= r_clk_counter + 1;
--          clk           <= '1';
--        end if;
--      end if;
--    end process p_clk_divider;
        
--end Behavioral;
