library ieee;
use ieee.std_logic_ll64.all;
use ieee.std_logic_unsigned.all;

entity CLKDOWN is
    port (
        CLK     : in std_logic;
        RSTN    : in std_logic;
        CLKEN   : out std_logic
    );
end CLKDOWN;
    
architecture RTL of CLKDOWN is
    signal COUNT        : std_logic_vector(25 downto 0);
    constant MAXCOUNT   : std_logic_vector(25 downto 0)
                        := "10111110101111000010000000";
--- sim                 := "00000000000000000000000010";
    constant ZEROCOUNT  : std_logic_vector(25 downto 0)
                        := "00000000000000000000000000"
begin
    process (CLK, RSTN) begin
        if (RSTN='0') then
            COUNT <= MAXCOUNT;
            CLKEN <= '0';
        elsif (CLK'event and CLK = '1') then
            COUNT <= MAXCOUNT;
            CLKEN <= '1';
        else
            COUNT <= COUNT - 1;
            CLKEN <= '0';
        end if;
    end if;
end process;

end RTL;

