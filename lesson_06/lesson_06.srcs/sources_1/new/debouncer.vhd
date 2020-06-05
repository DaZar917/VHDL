----------------------------------------------------------------------------------
-- Company:  DCI FEEI TUKE
-- Engineer: Norbert Ádám
-- 
-- Create Date: 09.10.2019 13:40:11
-- Design Name: 
-- Module Name: debouncer - Behavioral
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

entity debouncer is
    generic (sys_freq       : natural := 100_000_000; -- in Hz
             stable_time    : natural := 10);  -- in ms 
    Port ( clk      : in STD_LOGIC;
           btn      : in STD_LOGIC;
           q        : out STD_LOGIC);
end debouncer;

architecture Structural of debouncer is

    -- Flip-flop D type
    component dff is
        Port ( clk  : in  STD_LOGIC;
               d    : in  STD_LOGIC; 
               q    : out  STD_LOGIC);
    end component dff;

    -- Flip-flop D type with enable input
    component dff_en is
        Port ( clk  : in  STD_LOGIC;
               rst  : in  STD_LOGIC; 
               d    : in  STD_LOGIC;
               en   : in  STD_LOGIC; 
               q    : out  STD_LOGIC);
    end component dff_en;

    component counter is
        generic (up_counter : boolean := TRUE;
                 width      : positive := 8; 
                 init_value : natural := 0);
        Port ( clk  : in STD_LOGIC;
               rst  : in STD_LOGIC;
               en   : in STD_LOGIC;
               Y    : out STD_LOGIC_VECTOR (width-1 downto 0);
               o    : out STD_LOGIC);
    end component counter;

    signal q_ff1, q_ff2 : std_logic; 
    signal en : std_logic;
    signal counter_rst : std_logic;
    signal detect_zero : std_logic;
    
begin

    FF1 : dff port map (clk => clk, d => btn, q => q_ff1);
    FF2 : dff port map (clk => clk, d => q_ff1, q => q_ff2);

    counter_rst <= q_ff1 xor q_ff2;

    en <= not detect_zero;
    CNT : counter generic map (up_counter => false, init_value => ((sys_freq*stable_time)/1000), width => 8) port map (clk => clk, rst => counter_rst, en => en, o => detect_zero);

    FF3 : dff_en port map (clk => clk, rst => counter_rst, d => q_ff2, en => detect_zero, q => q);
    
end Structural;
