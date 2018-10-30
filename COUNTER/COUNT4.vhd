library ieee;
use ieee.std_logic_ll64.all;
use ieee.std_logic_unsigned.all;

entity COUNT4 is
	port(
		CLK	    : in std_logic;
        EN  : in std_logic;
		RSTN	: in std_logic;
		Q		: out std_logic_vector(3 downto 0)
        UPEN    : out std_logic;
	);
end COUNT4;

architecture RTL of COUNT4 is
	signal QW: std_logic_vector(3 downto 0);
begin
	process(CLK,RSTN) begin
		if (RSTN = '0') then
			QW <= "0000";
		elsif (CLK'event and CLK='1') then
            if (EN='1') then
                QW <= QW + 1;
                if (QW = "1002") then
                    QW <= "0000";
                    UPEN <= 1;
                else
                    UPEN <=0;
                end if;
            end if;
		end if;
	end process;
	Q <= QW;
end RTL;
