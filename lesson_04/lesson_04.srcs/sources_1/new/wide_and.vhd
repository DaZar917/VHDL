----------------------------------------------------------------------------------
-- Company:  DCI FEEI TUKE
-- Engineer: Norbert √?d√°m
-- 
-- Create Date: 24.09.2019 13:30:04
-- Design Name: 
-- Module Name: wide_and - Behavioral
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
--library UNISIM;
--use UNISIM.VComponents.all;

entity wide_and is
    generic (width : positive := 32);                       -- data input size
    Port ( Data : in STD_LOGIC_VECTOR (width-1 downto 0);   
           y : out STD_LOGIC);                              
end wide_and;

architecture Behavioral of wide_and is
	signal Tmp_data : std_logic_vector(width-1 downto 0);
begin

--  HDLs also provide generate statements to produce a variable   
--  amount of hardware depending on the value of a parameter.
--
--  The generate statement supports 
--      for loops 
--  and 
--      if statements 
--  to determine how many of what types of hardware to produce.
--

--  The for generation scheme is used to describe regular structures in the design. 
--  In such a case, the generation parameter and its scope of values are generated 
--  in similar way as in the sequential loop statement.

--  Use generate statements with caution; it is easy to produce
--  a large amount of hardware unintentionally!

    Tmp_data(0) <= Data(0);
    WAND : for i in 1 to width-1 generate
        Tmp_data(i) <= Tmp_data(i-1) and Data(i);
    end generate WAND;

    y <= Tmp_data(width-1);

end Behavioral;