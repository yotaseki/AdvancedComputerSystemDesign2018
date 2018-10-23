library ieee;
use ieee.std_logic_1164.all;

entity HIGH3 is
    port(
        A   : in std_logic_vector(2 downto 0);
        Y   : out std_logic
        );
end HIGH3;

architecture RTL of HiGH3 is
    signal W0: std_logic;
begin
    W0 <= A(1) and A(2);
    Y <= A(0) or W0;;
end RTL;
