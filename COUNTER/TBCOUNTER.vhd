library ieee;
use ieee.std_logic_1164.all;

entity TBCOUNTER is
end TBCOUNTER;

architecture TESTBENCH of TBCOUNTER is
    component COUNTER
        port(
                CLK : in std_logic;
                RSTN: in std_logic;
                SSN:  in std_logic;
                LEDOUTL: out std_logic_vector(6 downto 0);
                LEDOUTH: out std_logic_vector(6 downto 0)
        );
    end component;
    signal TBCLK        : std_logic;
    signal TBRSTN       : std_logic;
    signal TBSSN      : std_logic;
    signal TBLEDOUTL    : std_logic_vector(6 downto 0);
    signal TBLEDOUTH    : std_logic_vector(6 downto 0);
    
    constant CLK_CYCLE : time := 100 ns;
	 
begin
	U1 : COUNTER port map(
		CLK => TBCLK, RSTN => TBRSTN, SSN=>TBSSN, LEDOUTL=>TBLEDOUTL, LEDOUTH=>TBLEDOUTH
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
        TBSSN <= '1'; wait for CLK_CYCLE/2;
                      wait for CLK_CYCLE*5;
        TBSSN <= '0'; wait for CLK_CYCLE*5;
        TBSSN <= '1'; wait for CLK_CYCLE*30;
        TBSSN <= '0'; wait for CLK_CYCLE*5;
        TBSSN <= '1'; wait;
    end process;
end TESTBENCH;

configuration CFG_TBCOUNTER of TBCOUNTER is
	for TESTBENCH
		for U1 : COUNTER
		end for;
	end for;
end;
