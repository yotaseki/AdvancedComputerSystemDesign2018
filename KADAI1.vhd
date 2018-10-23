library ieee;
use ieee.std_logic_1164.all;

entity KADAI1 is
    port(
        A : in std_logic_vector(2 downto 0);
        LEDOUT : out std_logic_vector(6 downto 0)
    );
end KADAI1;

architecture RTL of KADAI1 is
    component HIGH3
    port(
        A : in std_logic_vector(2 downto 0);
        Y : out std_logic
    );
    end component;
    
    signal W0,W1,W2,W3 : std_logic;

    begin
        W0 <=not(A(0));
        W1 <= not(A(1));
        W2 <= not(A(2));
        i0: HIGH3 port map(
            A(2)=>W2,  A(1)=>W1, A(0)=>W0, Y=>W3
        );

    process (W3) begin
        case W3 is
            when '1' => LEDOUT <= "0001001";
            when '0' => LEDOUT <= "1000111";
        end case;
    end process;
end RTL;
