entity REG4 is
	port (
		D		: in std_logic_vector(3 downto 0);
		CLK		: in std_logic;
		RSTN	: in std_logic;
		Q		: out std_logic_vector(3 downto 0)
	);
end REG4;

architecture RTL of REG4 is
begin
	process(CLK,RSTN) begin
		if (RSTN = '0') then
			Q <= "0000";
		elsif (CLK'event and CLK='1') then
			Q <= D;
		end if;
	end if;
end process;

end RTL;
