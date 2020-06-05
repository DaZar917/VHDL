----------------------------------------------------------------------------------
-- Company:  DCI FEEI TUKE
-- Engineer: Norbert Ádám
-- 
-- Create Date: 24.09.2019 19:54:34
-- Design Name: 
-- Module Name: wide_and_tb - Behavioral
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

entity wide_and_tb is
--  Port ( );
end wide_and_tb;

architecture Behavioral of wide_and_tb is

    constant width : positive := 32; 
    -- Component Declaration for the Unit Under Test (UUT)
    component wide_and is
        generic (width : positive := 32);                       -- data input size
        Port ( Data : in STD_LOGIC_VECTOR (width-1 downto 0);
               y : out STD_LOGIC);
    end component wide_and;

    --Inputs
    signal Data : std_logic_vector(width-1 downto 0) := (others => '0');
 
      --Outputs
    signal y : std_logic;
    
begin
	-- Instantiate the Unit Under Test (UUT)
    UUT: wide_and port map (Data => Data, y => y);
 
    -- Stimulus process
    stim_proc: process         
     begin        
       -- hold reset state for 100 ns.
       wait for 100 ns;    
 
         data <= X"00000000";
         wait for 100 ns;    
         data <= X"FFFFFFFF";
         wait for 100 ns;    
         data <= X"ABCDEF00";
         
       wait;
    end process;

end Behavioral;
