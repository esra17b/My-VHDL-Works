----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.10.2025 13:48:57
-- Design Name: 
-- Module Name: n_bit_adder - Behavioral
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

entity n_bit_adder is
--  Port ( );
generic (
N   : integer := 4
);
port (
a_i     : in std_logic_vector (N-1 downto 0);
b_i     : in std_logic_vector (N-1 downto 0);
carry_i : in std_logic;
sum_o   : out std_logic_vector (N-1 downto 0);
carry_o : out std_logic
);
end n_bit_adder;

architecture Behavioral of n_bit_adder is

-- COMPONENT DECLERATION
component full_adder is 
port (
a_i      : in std_logic;
b_i      : in std_logic;
carry_i  : in std_logic;
sum_o    : out std_logic;
carry_o  : out std_logic
);
end component;

signal temp : std_logic_vector (N downto 0) := (others => '0');

begin

temp(0) <= carry_i;
carry_o <= temp(N);

FULL_ADDER_GEN: for k in 0 to N-1 generate
    full_adder_k  : full_adder
    port map(
    a_i     => a_i(k),
    b_i     => b_i(k),
    carry_i => temp(k),
    sum_o   => sum_o(k),
    carry_o => temp(k+1)
    );
end generate;
    
end Behavioral;
