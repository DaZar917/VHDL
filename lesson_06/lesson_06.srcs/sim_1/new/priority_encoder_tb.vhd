----------------------------------------------------------------------------------
-- Company:  DCI FEEI TUKE
-- Engineer: Norbert Ádám
-- 
-- Create Date: 08.10.2019 14:26:57
-- Design Name: 
-- Module Name: priority_encoder_tb - Behavioral
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

entity priority_encoder_tb is
--  Port ( );
end priority_encoder_tb;

architecture Behavioral of priority_encoder_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    constant width : positive := 4;
    component priority_encoder is
        generic ( width : natural := width);
        Port ( D : in STD_LOGIC_VECTOR (width**2-1 downto 0);
               Y : out STD_LOGIC_VECTOR (width-1 downto 0);
               v : out STD_LOGIC);
    end component priority_encoder;
    
    -- Inputs
    signal D : std_logic_vector(width**2-1 downto 0) := (others => '0');
    
    -- Outputs
    signal Y : std_logic_vector(width-1 downto 0);
    signal v : std_logic;
    
    -- Clock 
    constant clk_period : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    UUT: priority_encoder generic map (width => width) port map (D => D, Y => Y, v => v);

    -- Stimulus process
    stim_proc : process
        variable test_eq, test_lt, test_gt : std_logic;
    begin    
        -- Hold reset state for 100 ns.
        wait for 100 ns;    

        for i in 0 to width**2-1 loop
            D <= std_logic_vector(to_unsigned(i, D'length));                
            wait for 2*clk_period;
        end loop;    
        
        D <= "0-1X" & X"abc";            
   
        wait; 
    end process;    

end Behavioral;
