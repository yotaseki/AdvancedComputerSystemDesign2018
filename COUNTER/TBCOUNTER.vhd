library ieee;
use ieee.std_logic_1164.all;

entity TBCOUNTER is
end TBCOUNTER;

architecture TESTBENCH of TBCOUNTER is
    component COUNTER
        port(
                CLK : in std_logic;
                RSTN: in std_logic;
                STARTN: in std_logic;
                STOPN:  in std_logic;
                LEDOUTL: out std_logic_vector(6 downto 0);
                LEDOUTH: out std_logic_vector(6 downto 0)
        );
    end component;
    signal TBCLK        : std_logic;
    signal TBRSTN       : std_logic;
    signal TBSTARTN     : std_logic;
    signal TBSTOPN      : std_logic;
    signal TBLEDOUTL    : std_logic_vector(6 downto 0);
    signal TBLEDOUTH    : std_logic_vector(6 downto 0);
    
    constant CLK_CYCLE : time := 100 ns;
	 
begin
	U1 : COUNTER port map(
		CLK => TBCLK, RSTN => TBRSTN, STARTN=>TBSTARTN, STOPN=>TBSTOPN, LEDOUTL=>TBLEDOUTL, LEDOUTH=>TBLEDOUTH
	);
    process begin
        TBCLK <= '0'; wait for CLK_CYCLE/2;
        TBCLK <= '1'; wait for CLK_CYCLE/2;
    end process;

    process begin
        TBRSTN <= '0'; wait for CLK_CYCLE/4;
        TBRSTN <= '1'; wait;
    end process;

    process begin
        TBSTARTN <= '1'; TBSTOPN <='1';  wait for CLK_CYCLE/2;
                                        wait for CLK_CYCLE*5;
        TBSTARTN <= '0'; TBSTOPN <='1'; wait for CLK_CYCLE*5;
        TBSTARTN <= '1'; TBSTOPN <='1'; wait for CLK_CYCLE*10;
        TBSTARTN <= '1'; TBSTOPN <='0'; wait for CLK_CYCLE*5;
        TBSTARTN <= '1'; TBSTOPN <='1'; wait;
    end process;
end TESTBENCH;

configuration CFG_TBCOUNTER of TBCOUNTER is
	for TESTBENCH
		for U1 : COUNTER
		end for;
	end for;
end;
