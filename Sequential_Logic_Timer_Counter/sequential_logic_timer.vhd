----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.10.2025 13:01:37
-- Design Name: 
-- Module Name: sequential_logic_timer - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sequential_logic_timer is
--  Port ( );
generic (
c_clkfreq   : integer := 100_000_000
);
port (
clk          : in std_logic;
sw           : in std_logic_vector (1 downto 0);
counter      : out std_logic_vector (7 downto 0)
);
end sequential_logic_timer;

architecture Behavioral of sequential_logic_timer is

constant c_timer2seclim : integer := c_clkfreq*2;
constant c_timer1seclim : integer := c_clkfreq;
constant c_timer500mslim : integer := c_clkfreq/2;
constant c_timer250mslim : integer := c_clkfreq/4;

signal timer       : integer range 0 to c_timer2seclim := 0;
signal timerlim    : integer range 0 to c_timer2seclim :=0;
signal counter_int : std_logic_vector (7 downto 0) := (others => '0' );

begin

--combination logic assigment
timerlim     <= c_timer2seclim  when sw = "00" else
                c_timer1seclim  when sw = "01" else
                c_timer500mslim when sw = "10" else
                c_timer250mslim;
  
process (clk) begin
if (rising_edge(clk)) then

    if (timer >= timerlim-1) then
        counter_int <= counter_int +1 ;
        timer       <= 0;
    else   
        timer       <= timer + 1 ;    
    end if;

end if;    
end process;
 
counter <= counter_int;
                 
end Behavioral;
