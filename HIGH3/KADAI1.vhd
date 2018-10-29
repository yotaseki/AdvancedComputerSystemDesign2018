library  ieee;
use ieee.std_logic_1164.all;

entity KADAI1 is
    port (
        A   : in std_logic_vector(2 downto 0);
        LEDOUT  : out std_logic_vector(6 downto 0)
    );
end KADAI1;

architecture RTL of KADAI1 is
    component HIGH3
    port(
        A   : in std_logic_vector(2 downto 0);
        Y   : out std_logic
    );
    end component;
signal W0: std_logic_vector(2 downto 0);
signal W1: std_logic;
begin
    W0 <= not(A);
    i0: HIGH3   port map(
        Y=>W1, A=>W0
    );
    process(W1) begin
        if ( W1 = '0') then     LEDOUT  <= "1000111";
        elsif (W1 = '1')then    LEDOUT  <= "0001001";
        else                    LEDOUT  <= "0111111";
        end if;
    end process;
end RTL;
