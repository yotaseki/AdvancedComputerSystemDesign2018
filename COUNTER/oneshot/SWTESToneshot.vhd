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
    signal DIVCOUNT : std_logic_vector(14 downto 0);
    signal ENABLE   : std_logic;
    signal STARTBEFORE : std_logic;
    signal STOPBEFORE : std_logic;
begin
    process (CLK,RSTN) begin
        if (RSTN='0') then
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
            STARTBEFORE <= '1';
            STOPBEFORE <= '1';
        elsif(CLK'event and CLK = '1') then
            if ENABLE='1' then
                if STARTN='0' and STARTBEFORE = '1' then
                    EN <= '1';
				elsif STOPN='0' and STOPBEFORE='1' then
                    EN <= '0';
                end if;
                STARTBEFORE <= STARTN;
                STOPBEFORE <= STOPN;
            end if;
        end if;
    end process;
end RTL;
