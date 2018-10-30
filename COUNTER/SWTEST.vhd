library ieee;
use ieee.std_logic_ll64.all;
use ieee.std_logic_unsigned.all;

entity SWTEST is
    port (
        CLK,RSTN    : in std_logic;
        STARTN      : in std_logic;
        SWONE       : out std_logic
    );
end SWTEST;

architecture RTL of SWTEST is
    signal DIVCOUNT : std_logic_vector(14 downto 0);
    signal SWBEFORE : std_logic;
    signal ENABLE   : std_logic;
begin
    process (CLK,RSTN) begin
        if (CLK'event and CLK = '1') then
            if DIVCOUNT = "000000000000" then
                ENABLE <= '1';
            else 
                ENABLE <= '0';
            end if;
            DIVCOUNT <= DIVCOUNT + 1;
        end if;
    end process;

    process (CLK) begin
        if(CLK'event and CLK = '1') then
            if ENABLE='1' then
                if SW='0' and SWBEFORE = '1' then
                    SWONE <= '0';
                else
                    SWONE <= '1';
                end if;
                SWBEFORE <= SW;
            else
                SWONE <= '1';
            end if;
        end if;
    end process;
end RTL;
