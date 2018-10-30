library ieee;
use ieee.std_logic_ll64.all;
use ieee.std_logic_unsigned.all;

entity SWTEST is
    port (
        CLK,RSTN    : in std_logic;
        SW          : in std_logic;
        SWEN        : out std_logic
    );
end SWTEST;

architecture RTL of SWTEST is
    signal DIVCOUNT : std_logic_vector(14 downto 0);
    signal SWBEFORE : std_logic;
    signal ENABLE   : std_logic;
begin
    process (CLK,RSTN) begin
        if (RSTN='0') then
            ENABLE <= '0'
        if (CLK'event and CLK = '1') then
            if DIVCOUNT = "000000000000" then
                ENABLE <= '1';
            else 
                ENABLE <= '0';
            end if;
            DIVCOUNT <= DIVCOUNT + 1;
        end if;
    end process;

    process (CLK,RSTN) begin
        if (RSTN='0') then
            SWBEFORE <= '1'
        if(CLK'event and CLK = '1') then
            if ENABLE='1' then
                if SW='0' and SWBEFORE = '1' then
                    SWEN <= '0';
                else
                    SWEN <= '1';
                end if;
                SWBEFORE <= SW;
            else
                SWEN <= '1';
            end if;
        end if;
    end process;
end RTL;
