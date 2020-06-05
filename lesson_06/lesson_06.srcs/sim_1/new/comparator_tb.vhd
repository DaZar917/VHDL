----------------------------------------------------------------------------------
-- Company:  DCI FEEI TUKE
-- Engineer: Norbert Ádám
-- 
-- Create Date: 25.09.2019 14:02:01
-- Design Name: 
-- Module Name: comparator_tb - Behavioral
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

entity comparator_tb is
--  Port ( );
end comparator_tb;

architecture Behavioral of comparator_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    constant width : positive := 8;
    component comparator is
        generic ( width : positive := width);
        Port ( A, B : in STD_LOGIC_VECTOR (width-1 downto 0);
               lt, eq, gt : out STD_LOGIC);
    end component comparator;
    
    
    -- Inputs
    signal A : std_logic_vector(width-1 downto 0) := (others => '0');
    signal B : std_logic_vector(width-1 downto 0) := (others => '0');
    
    -- Outputs
    signal lt : std_logic;
    signal eq : std_logic;
    signal gt : std_logic;
    
    -- Clock 
    constant clk_period : time := 10 ns;
    
    -- Which architecture we'll use
    for uut : comparator use entity work.comparator(Behavioral_v1); 

begin
    -- Instantiate the Unit Under Test (UUT)
    UUT: comparator port map (A => A, B => B, eq => eq, lt => lt, gt => gt);
    
    -- Stimulus process
    stim_proc : process
        variable test_eq, test_lt, test_gt : std_logic;
    begin        
        -- Hold reset state for 100 ns.
        wait for 100 ns;    
    
        for i in 0 to 2**width-1 loop
            A <= std_logic_vector(to_unsigned(i, width));
            for j in 0 to 2**width-1 loop
                B <= std_logic_vector(to_unsigned(j, width));                
                wait for 2*clk_period;
                
                test_lt := '0';
                test_eq := '0';
                test_gt := '0';
                if i < j then
                    test_lt := '1';
                elsif i = j then
                    test_eq := '1';
                else
                    test_gt := '1';
                end if;
                
                assert eq = test_eq and lt = test_lt and gt = test_gt
                    report "Wrong result for arguments : A = " & integer'image(i) & ", B = " & integer'image(j) 
                    severity failure;
                
            end loop;
        end loop;
    
        wait;
    end process;

end Behavioral;