----------------------------------------------------------------------------------
-- Company:  DCI FEEI TUKE
-- Engineer: Norbert Ádám
-- 
-- Create Date: 25.09.2019 14:01:21
-- Design Name: 
-- Module Name: comparator - Behavioral
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

entity comparator is
    generic ( width : positive := 3);
    Port ( A, B : in STD_LOGIC_VECTOR (width-1 downto 0);
           lt, eq, gt : out STD_LOGIC);
end comparator;

architecture Behavioral_v1 of comparator is

begin

	eq <= '1' when A = B else '0';
	lt <= '1' when A < B else '0';
	gt <= '1' when A > B else '0';

end Behavioral_v1;

--architecture Behavioral_v2 of comparator is

--	signal tmp_eq, tmp_lt : std_logic;

--begin

--	tmp_eq <= '1' when A = B else '0';
--	tmp_lt <= '1' when A < B else '0';
		
--	gt <= (not tmp_eq) and (not tmp_lt);
--	lt <= tmp_lt;
--	eq <= tmp_eq;

--end Behavioral_v2;

--architecture Structural of comparator is

--signal Tmp_bit_eq, Tmp_eq : std_logic_vector(width-1 downto 0); 
--signal Tmp_bit_lt, Tmp_lt : std_logic_vector(width-1 downto 0);

--begin
	
--	-------------------------------------------
--	------------------ EQUAL ------------------
--	-------------------------------------------
--	BIT_XNOR : for i in width-1 downto 0 generate
--		Tmp_bit_eq(i) <= A(i) xnor B(i);
--	end generate BIT_XNOR;
	
--	Tmp_eq(width-1) <= Tmp_bit_eq(width-1);
--	EQUAL : for i in width-2 downto 0 generate
--		Tmp_eq(i) <= Tmp_eq(i+1) and Tmp_bit_eq(i);
--	end generate EQUAL;
	
--	eq <= Tmp_eq(0);

--	-------------------------------------------
--	--------------- LESS THAN -----------------
--	-------------------------------------------
--	BIT_LESS : for i in width-1 downto 0 generate
--		Tmp_bit_lt(i) <= (not A(i)) and B(i);
--	end generate BIT_LESS;
	
--	Tmp_lt(width-1) <= Tmp_bit_lt(width-1);
--	LESS : for i in width-2 downto 0 generate
--		Tmp_lt(i) <= Tmp_lt(i+1) or ( Tmp_eq(i+1) and Tmp_bit_lt(i) );
--	end generate LESS;
	
--	lt <= Tmp_lt(0);
	
--	-------------------------------------------
--    -------------- GREATER THAN----------------
--    -------------------------------------------
--	gt <= (not Tmp_eq(0)) and (not Tmp_lt(0));
	
--end Structural;