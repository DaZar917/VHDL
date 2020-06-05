----------------------------------------------------------------------------------
-- Company:  DCI FEEI TUKE
-- Engineer: Norbert Ádám
-- 
-- Create Date: 11.10.2019 15:27:39
-- Design Name: 
-- Module Name: debouncer_tb - Behavioral
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

entity debouncer_tb is
--  Port ( );
end debouncer_tb;

architecture Behavioral of debouncer_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component debouncer is
        generic (sys_freq       : natural := 1_000; -- in Hz
                 stable_time    : natural := 10);  -- in ms 
        Port ( clk      : in STD_LOGIC;
               btn      : in STD_LOGIC;
               q        : out STD_LOGIC);
    end component debouncer;

    -- Inputs
    signal btn : STD_LOGIC := '0';
    -- Clock signal
        signal clk : STD_LOGIC := '0';
        constant clk_period : time := 10 ns;    --100 MHz
    
    -- Output
    signal q : STD_LOGIC;

begin

    -- Instantiate the Unit Under Test (UUT)
    UUT: debouncer port map (clk => clk, btn => btn, q => q);
    
    clock_generator : process 
    begin
        clk <= '0';
        wait for clk_period;
        clk <= '1';
        wait for clk_period;
    end process;
    
    -- Stimulus process
    stim_proc : process
    begin            
        btn <= '1', '0' after 50 ns, '1' after 70ns, '0' after 100 ns, '1' after 120ns;
        wait for 400 ns;
        btn <= '1', '0' after 50 ns, '1' after 75ns, '0' after 110 ns, '1' after 120ns;
        wait;
    end process;    


end Behavioral;
