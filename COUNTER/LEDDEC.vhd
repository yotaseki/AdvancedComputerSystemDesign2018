library ieee;
use ieee.std_logic_1164.all;

entity LEDDEC is
    port(
    DATA    : in std_logic_vector(3 downto 0);
    LEDOUTN  : out std_logic_vector(6 downto 0)
    );
end LEDDEC;

architecture RTL of LEDDEC is
begin
    process (DATA) begin
        case DATA is
            when "0000" => LEDOUTN <= "1000000";
            when "0001" => LEDOUTN <= "1111001";
            when "0010" => LEDOUTN <= "0100100";
            when "0011" => LEDOUTN <= "0110000";
            when "0100" => LEDOUTN <= "0011001";
            when "0101" => LEDOUTN <= "0010010";
            when "0110" => LEDOUTN <= "0000010";
            when "0111" => LEDOUTN <= "1011000";
            when "1000" => LEDOUTN <= "0000000";
            when "1001" => LEDOUTN <= "0010000";
            when "1010" => LEDOUTN <= "0111111";
            when "1011" => LEDOUTN <= "0111111";
            when "1100" => LEDOUTN <= "0111111";
            when "1101" => LEDOUTN <= "0111111";
            when "1110" => LEDOUTN <= "0111111";
            when "1111" => LEDOUTN <= "0111111";
            when others => LEDOUTN <= "0111111";
        end case;
    end process;
end RTL;
