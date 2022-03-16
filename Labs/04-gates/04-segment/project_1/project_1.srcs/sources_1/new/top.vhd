----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2022 09:43:07 AM
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
    Port ( SW : in STD_LOGIC_VECTOR (3 downto 0); --Input binary datat
           LED : out STD_LOGIC_VECTOR (7 downto 0); --LED idicators
           CA : out STD_LOGIC;  --cathod A
           CB : out STD_LOGIC;  --B
           CC : out STD_LOGIC;  --C
           CD : out STD_LOGIC;  --D
           CE : out STD_LOGIC;  --E
           CF : out STD_LOGIC;  --F
           CG : out STD_LOGIC;  --cathod G
           AN : out STD_LOGIC_VECTOR (7 downto 0));--Common anode signals to individual displays
end top;

-- Architecture body for top level
------------------------------------------------------------------------
architecture Behavioral of top is
begin
    --------------------------------------------------------------------
    -- Instance (copy) of hex_7seg entity
    hex2seg : entity work.hex_7seg
        port map(
            hex_i    => SW,
            seg_o(6) => CA,
            seg_o(5) => CB,
            seg_o(4) => CC,
            seg_o(3) => CD,
            seg_o(2) => CE,
            seg_o(1) => CF,
            seg_o(0) => CG
        );

     -- Connect one common anode to 3.3V
    AN <= b"1111_0111";

    -- Display input value on LEDs
    LED(3 downto 0) <= SW;
    
    -- Experiments on your own: LED(7:4) indicators

-- Turn LED(4) on if input value is equal to 0, ie "0000"
LED(4) <= NOT( SW(0) OR SW(1) OR SW(2) OR SW(3));

-- Turn LED(5) on if input value is greater than "1001", ie 10, 11, 12, ...
greater_less : process ( SW ) is
  begin
  if SW > "1010" then
    LED(5) <= '1' ;
  else
    LED(5) <= '0' ;
  end if ;
end process greater_less ;

-- Turn LED(6) on if input value is odd, ie 1, 3, 5, ...
LED(6) <= NOT SW(0);

-- Turn LED(7) on if input value is a power of two, ie 1, 2, 4, or 8



end architecture Behavioral;


--end Behavioral;
