library ieee;
use ieee.std_logic_ll64.all;

entity COUNTER is
    port (
        CLK : in std_logic;
        RSTN: in std_logic;
        START: in std_logic;
        STOP:  in std_logic;
        LEDOUTL: out std_logic_vector(7 downto 0);
        LEDOUTH: out std_logic_vector(7 downto 0)
    );
end COUNTER;
architecture RTL of COUNTER is
    signal CLKENABLE    : std_logic;
    signal STARTENABLE     : std_logic;
    signal STOPENABLE,STOPENABLEN     : std_logic;
    signal SWENABLE :std_logic;
    signal UPENABLEL     : std_logic;
    signal UPENABLEH     : std_logic;
    signal COUNTL       : std_logic_vector(3 downto 0);
    signal COUNTH       : std_logic_vector(3 downto 0);
    signal LEDL         : std_logic_vector(6 downto 0);
    signal LEDH         : std_logic_vector(6 downto 0);
    
    component SWTEST port (
        CLK,RSTN    : in std_logic;
        SW          : in std_logic;
        SWEN        : out std_logic;
        );
    end component;

    component LEDDEC port (
        DATA    : in std_logic_vector(3 downto 0);
        LEDOUT  : out std_logic_vector(7 downto 0)
        );
    end component;
    
    component CLKDOWN port(
        CLK     : in std_logic;
        RSTN    : in std_logic;
        CLKEN  : out std_logic
        );
    end component;
    
    component COUNT4 port(
        CLK,RSTN     : in std_logic;
        EN    : in std_logic;
        Q       : out std_logic_vector(3 downto 0)
        UPEN      : out std_logic;
        );
    end component;

begin
    U1 : SWTEST port map(
        CLK=>CLK, RSTN=>RSTN, SW=>START, SWEN=>STARTENABLE
    );
    U2 : SWTEST port map(
        CLK=>CLK, RSTN=>RSTN, SW=>STOP, SWEN=>STOPENABLE
    );
    STOPENABLEN = STOPENABLE;
    U3 : LEDDEC port map (
        DATA=>COUNTL, LEDOUT=>LEDL
    );
    U4 : LEDDEC port map (
        DATA=>COUNTH, LEDOUT=>LEDH
    );
    U5 : CLKDOWN port map (
        CLK=>CLK, RSTN=>RSTN, CLKEN=>CLKENABLE
    );
    SWENABLE <= STARTENABLE and not(STOPENABLE);
    U6 : COUNT4 port map (
        CLK=>CLKENABLE, EN=>SWENABLEN , RSTN=>RSTN, Q=>COUNTL, UPEN=>UPENABLEL
    );
    U7 : COUNT4 port map (
        CLK=>CLKENABLE, EN=>UPENABLEL , RSTN=>RSTN, Q=>COUNTH, UPEN=>UPENABLEH
    );
    LEDOUTL = LEDL;
    LEDOUTH = LEDH;

end RTL;


