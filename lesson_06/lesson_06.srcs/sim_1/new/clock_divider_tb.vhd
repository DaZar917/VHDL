----------------------------------------------------------------------------------
-- Company:  DCI FEEI TUKE
-- Engineer: Norbert Ádám
-- 
-- Create Date: 09.10.2019 11:16:22
-- Design Name: 
-- Module Name: clock_divider_tb - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_divider_tb is
--  Port ( );
end clock_divider_tb;

architecture Behavioral of clock_divider_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component clock_divider is
        generic (divider : natural range 2 to 100 := 2);
        Port ( sys_clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               clk : out STD_LOGIC);
    end component clock_divider;

    -- Inputs
        -- Clock
        signal sys_clk : STD_LOGIC := '0';
        constant clk_period : time := 10 ns;
    signal rst : STD_LOGIC := '0';
    
    -- Output
    signal clk : STD_LOGIC;

begin

    -- Instantiate the Unit Under Test (UUT)
    UUT: clock_divider generic map (divider => 5) port map (sys_clk => sys_clk, rst => rst, clk => clk);
        
    system_clock_generator : process 
    begin
        sys_clk <= '0';
        wait for clk_period;
        sys_clk <= '1';
        wait for clk_period;
    end process;

    -- Stimulus process
    stim_proc : process
    begin            
        rst <= '1', '0' after 100 ns;
        wait;
    end process;    

end Behavioral;
