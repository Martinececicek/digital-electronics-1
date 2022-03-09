------------------------------------------------------------
--
-- Example of 4-bit binary comparator using the when/else
-- assignments.
-- EDA Playground
--
-- Copyright (c) 2020-Present Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for 4-bit binary comparator
------------------------------------------------------------
entity comparator_4bit is
    port(
        c_i           : in  std_logic_vector(4 - 1 downto 0);  --input signal
        d_i           : in  std_logic_vector(4 - 1 downto 0);  --input signal
        D_greater_C_o : out std_logic;  -- B is greater than A
        D_equals_C_o  : out std_logic;  -- B is equal to A
        D_less_C_o    : out std_logic  -- B is less than A
    );
end entity comparator_4bit;

------------------------------------------------------------
-- Architecture body for 4-bit binary comparator
------------------------------------------------------------
architecture Behavioral of comparator_4bit is
begin
    D_greater_C_o <= '1' when (d_i > c_i) else '0';
    D_equals_C_o  <= '1' when (d_i = c_i) else '0';
    D_less_C_o    <= '1' when (d_i < c_i) else '0';

end architecture Behavioral;
