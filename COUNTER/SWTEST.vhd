library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity SWTEST is
    port (
        CLK,RSTN		: in std_logic;
        SSN	            : in std_logic;
        EN				: out std_logic
    );
end SWTEST;

architecture RTL of SWTEST is
    signal DIVCOUNT     : std_logic_vector(14 downto 0);
    signal ENABLE       : std_logic;
	signal TENABLE      : std_logic;
    signal SSNBEFORE    : std_logic;
begin
    process (CLK,RSTN) begin
        if (RSTN='0') then
            DIVCOUNT = "000000000000000";
            ENABLE <= '0';
        elsif (CLK'event and CLK = '1') then
            if DIVCOUNT = "000000000000000" then
                ENABLE <= '1';
            else 
                ENABLE <= '0';
            end if;
            DIVCOUNT <= DIVCOUNT + 1;
        end if;
    end process;

    process (CLK,RSTN) begin
        if (RSTN='0') then
            TENABLE <= '0';
            SSNBEFORE <= '1';
        elsif (CLK'event and CLK = '1') then
            if ENABLE='1' then
                if (SSN = '0' and SSNBEFORE='1') then
                    if (TENABLE='1')
                        TENABLE <= '0';
                    else
                        TENABLE <= '1';
                    end if;
                end if;
            end if;
        end if;
    end process;
	EN <= TENABLE;
end RTL;
