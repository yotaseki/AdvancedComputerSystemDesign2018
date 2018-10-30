library ieee;
use ieee.std_logic_ll64.all;

entity COUNTER is
    port (
        CLK : in std_logic;
        RSTN: in std_logic;
        ENABLE: in std_logic;
        LEDL: out std_logic_vector(7 downto 0);
        LEDH: out std_logic_vector(7 downto 0)
    );
end COUNTER;
architecture RTL of COUNTER is
    signal CLKENABLE  : std_logic;
    signal SWENABLE  : std_logic;
    signal COUNTL   : std_logic_vector(3 downto 0);
    signal COUNTH   : std_logic_vector(3 downto 0);
    
    component SWTEST port (
        CLK,SW      : in std_logic;
        LED         : out std_logic;
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
        ENABLE  : out std_logic
        );
    end component;
    
    component COUNT4 port(
        CLK     : in std_logic;
        RSTN    : in std_logic;
        Q       : out std_logic_vector(3 downto 0)
        );
    end component;

begin
    U1 : LEDDEC port map (
    DATA => 
                         );
end RTL;


