library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity SWTEST is
    port (
        CLK,RSTN		: in std_logic;
        STARTN,STOPN	: in std_logic;
        EN				: out std_logic
    );
end SWTEST;

architecture RTL of SWTEST is
	signal ENABLE : std_logic;
begin
    process (CLK,RSTN) begin
        if (RSTN='0') then
            ENABLE <= '0';
        elsif (CLK'event and CLK = '1') then
			if (STARTN = '0') then
				ENABLE <= '1';
			elsif (STOPN = '0') then
				ENABLE <= '0';
			end if;
        end if;
    end process;
	EN <= ENABLE;
end RTL;
