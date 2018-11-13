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
    process(A) begin
	if (A >= "011") then
		Y <= '1';
	else
		Y <= '0';
	end if;
    end process;
end RTL;
