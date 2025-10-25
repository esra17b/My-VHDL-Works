----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.10.2025 17:00:04
-- Design Name: 
-- Module Name: tb_top - Behavioral
-- Project Name: 
-- Target Devices: 
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

use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_top is
generic (
N	: integer := 8
);
end tb_top;

architecture Behavioral of tb_top is

component top is
generic (
N	: integer := 8
);
port (
SW		: in std_logic_vector (15 downto 0);
BTNL	: in std_logic;
LED		: out std_logic_vector (8 downto 0)
);
end component;

signal SW		: std_logic_vector (15 downto 0) := (others => '0');
signal BTNL		: std_logic := '0';
signal LED		: std_logic_vector (8 downto 0);

begin

DUT : top
generic map (
N => N
)
port map (
SW		=> SW	 ,
BTNL    => BTNL  ,
LED	    => LED	 
);      


STIMULI : process begin

SW 		<= x"0000";
BTNL	<= '0';

wait for 20 ns;

SW		<= x"1234";
BTNL	<= '1';

wait for 20 ns;

for i in 0 to 255 loop
	SW(7 downto 0) <= SW(7 downto 0) + 1;
	SW(15 downto 8) <= SW(15 downto 8) + 2;
	BTNL	<= not BTNL;
	wait for 20 ns;
end loop;

for i in 0 to 255 loop
	SW(7 downto 0) <= SW(7 downto 0) - 1;
	SW(15 downto 8) <= SW(15 downto 8) - 2;
	BTNL	<= not BTNL;
	wait for 20 ns;
end loop;

-- for stop the simulation ,we use this blog
assert false
report "SIM DONE"
severity failure;

end process;


end Behavioral;