library ieee;
use ieee.std_logic_1164.all;

entity COUNTER is
    port (
        CLK : in std_logic;
        RSTN: in std_logic;
        SSN: in std_logic;
        LEDOUTL: out std_logic_vector(6 downto 0);
        LEDOUTH: out std_logic_vector(6 downto 0)
    );
end COUNTER;
architecture RTL of COUNTER is
    signal CLKEN,SWEN	: std_logic;
    signal COUNTENABLE	: std_logic;
    signal DATAL		: std_logic_vector(3 downto 0);
    signal DATAH		: std_logic_vector(3 downto 0);
    signal LEDL         : std_logic_vector(6 downto 0);
    signal LEDH         : std_logic_vector(6 downto 0);
    
    component SWTEST port (
        CLK,RSTN		: in std_logic;
        SSN             : in std_logic;
        EN				: out std_logic
        );
    end component;

    component LEDDEC port (
        DATA    : in std_logic_vector(3 downto 0);
        LEDOUTN : out std_logic_vector(6 downto 0)
        );
    end component;
    
    component CLKDOWN port(
        CLK,RSTN    : in std_logic;
        ENABLE      : in std_logic;
        EN		    : out std_logic
        );
    end component;
    
    component COUNT port(
        CLK,RSTN		: in std_logic;
        ENABLE			: in std_logic;
        COUNTH,COUNTL	: out std_logic_vector(3 downto 0)
        );
    end component;

begin
    U1 : SWTEST port map(
        CLK=>CLK, RSTN=>RSTN, SSN=>SSN, EN=>SWEN
    );
    U2 : CLKDOWN port map (
        CLK=>CLK, RSTN=>RSTN, ENABLE=>SWEN ,EN=>CLKEN
    );
    COUNTENABLE <= CLKEN;
    U3 : COUNT port map (
        CLK=>CLK, RSTN=>RSTN, ENABLE=>COUNTENABLE, COUNTL=>DATAL, COUNTH=>DATAH
    );
    U4 : LEDDEC port map (
        DATA=>DATAL, LEDOUTN=>LEDL
    );
    U5 : LEDDEC port map (
        DATA=>DATAH, LEDOUTN=>LEDH
    );
    LEDOUTL <= LEDL;
    LEDOUTH <= LEDH;

end RTL;


