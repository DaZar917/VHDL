----------------------------------------------------------------------------------
-- Company:  DCI FEEI TUKE
-- Engineer: Norbert Ádám
-- 
-- Create Date: 14.10.2019 21:43:50
-- Design Name: 
-- Module Name: dff_en_tb - Behavioral
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

entity dff_en_tb is
--  Port ( );
end dff_en_tb;

architecture Behavioral of dff_en_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component dff_en is
        Port ( clk  : in  STD_LOGIC;
               rst  : in  STD_LOGIC; 
               d    : in  STD_LOGIC;
               en   : in  STD_LOGIC; 
               q    : out  STD_LOGIC);
    end component dff_en;

    --Inputs
    signal rst  : std_logic := '0';
    signal d    : std_logic := '0';
    signal en   : std_logic := '0';
        -- Clock signal 
        signal clk : std_logic;
        constant clk_period : time := 10 ns;
    
    --Outputs
    signal q : std_logic;

begin

    -- Instantiate the Unit Under Test (UUT)
    UUT: dff_en port map (clk => clk, rst => rst, d => d, en => en, q => q);
    
    -- Clock process definitions
    clk_process : process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;
    
    
    -- Stimulus process
    stim_proc: process
    begin		
        -- hold reset state for 100 ns.
        rst <= '1', '0' after 100 ns;
        wait for 100 ns;	
        
        d <= '0', '1' after 104 ns, '0' after 116 ns, '1' after 134 ns;
        en <= '0', '1' after 50 ns, '0' after 70 ns, '1' after 90 ns;      
        
        wait;
    end process;

end Behavioral;
