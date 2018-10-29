library ieee;
use ieee.std_logic_1164.all;

entity TBKADAI1 is 
end TBKADAI1;

architecture TESTBENCH of TBKADAI1 is
	component KADAI1
		port(
			A : in std_logic_vector(2 downto 0);
			LEDOUT : out std_logic_vector(6 downto 0)
		);
	end component;
	signal TB_A: std_logic_vector(2 downto 0);
	signal TB_LEDOUT: std_logic_vector(6 downto 0);

begin
	U1 : KADAI1 port map(
		A => TB_A, LEDOUT => TB_LEDOUT );
	process begin
		TB_A <= "000"; wait for 100 ns;
		TB_A <= "001"; wait for 100 ns;
		TB_A <= "010"; wait for 100 ns;
		TB_A <= "011"; wait for 100 ns;
		TB_A <= "100"; wait for 100 ns;
		TB_A <= "101"; wait for 100 ns;
		TB_A <= "110"; wait for 100 ns;
		TB_A <= "111"; wait for 100 ns;
		wait;
	end process;
end TESTBENCH;

configuration CFG_TBKADAI1 of TBKADAI1 is
	for TESTBENCH
		for U1 : KADAI1
		end for;
	end for;
end;
