library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity COUNT is
	port(
			CLK,RSTN			: in std_logic;
			ENABLE				: in std_logic;
			COUNTH,COUNTL		: out std_logic_vector(3 downto 0)
);
end COUNT;

architecture RTL of COUNT is
	signal WH: std_logic_vector(3 downto 0);
	signal WL: std_logic_vector(3 downto 0);
begin
process(CLK,RSTN) begin
	if (RSTN = '0') then
		WH <= "0000";
		WL <= "0000";
	elsif (CLK'event and CLK='1') then
		if (ENABLE='1') then
			if (WH = "1001" and WL = "1001") then
				WL <= "0000";
				WH <= "0000";
			elsif (WL = "1001") then
				WL <= "0000";
				WH <= WH + 1;
			else
				WL <= WL + 1;
			end if; 
		end if;
	end if;
end process;
COUNTL <= WL;
COUNTH <= WH;
end RTL;
