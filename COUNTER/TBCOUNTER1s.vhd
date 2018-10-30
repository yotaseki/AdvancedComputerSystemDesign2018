library ieee;
use ieee.std_logic_ll64.all;

entity TBCOUNTER is
end TBCOUNTER;

architecture TESTBENCH of TBCOUNTER is
    component COUNTER
        port(
                CLK : in std_logic;
                RSTN: in std_logic;
                START: in std_logic;
                STOP:  in std_logic;
                LEDOUTL: out std_logic_vector(7 downto 0);
                LEDOUTH: out std_logic_vector(7 downto 0)
        );
    end component;
    signal TBCLK        : std_logic;
    signal TBRSTN       : std_logic;
    signal TBSTART      : std_logic;
    signal TBSTOP       :  std_logic;
    signal TBLEDOUTL    : std_logic_vector(7 downto 0);
    signal TBLEDOUTH    : std_logic_vector(7 downto 0);
    
    constant CLK_CYCLE : time := 100 ns;
    process begin
        TBCLK <= '0'; wait for CLK_CYCLE/2;
        TBCLK <= '1'; wait for CLK_CYCLE/2;
    end process;

    process begin
        TBRSTN <= '0'; wait for CLK_CYCLE/4;
        TBRSTN <= '1'; wait;
    end process

    process begin
        TESTARTN <= '1'; TBSTOP <='1';  wait for CLK_CYCLE/2;
                                        wait for CLK_CYCLE*5;
        TESTARTN <= '0'; TBSTOP <='1'; wait for CLK_CYCLE*5;
        TESTARTN <= '1'; TBSTOP <='1'; wait for CLK_CYCLE*10;
        TESTARTN <= '1'; TBSTOP <='0'; wait for CLK_CYCLE*5;
        TESTARTN <= '1'; TBSTOP <='1'; wait;
    end process;
end TESTBENCH;
