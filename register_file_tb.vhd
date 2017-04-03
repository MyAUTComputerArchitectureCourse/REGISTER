library ieee;
use ieee.std_logic_1164.all;

entity REGISTER_FILE_TB is
end entity;

architecture REGISTER_FILE_TB_ARCH of REGISTER_FILE_TB is
	component REGISTER_FILE is
		generic(
			REGESTER_SIZE 	: integer;							-- Size of each register in the register file
			REGISTER_COUNT 	: integer							-- Number of registers in the register file
			);
		
		port(
			IDATA		: in std_logic_vector(REGESTER_SIZE - 1 downto 0);							--	STD logic vector for input data
			CLK			: in std_logic;															--	Clock input
			SEL			: in std_logic_vector(4 - 1 downto 0);		--	Select signal for addressing to registers
			RES 		: in std_logic;															--	Reset signal
			WRITE_EN	: in std_logic;															--	Wrinting enable signal
			READ_EN		: in std_logic;															--	Reading enable signal
			ODATA		: out std_logic_vector(REGESTER_SIZE - 1 downto 0)							--	Output of data
			);
	end component;

	constant REG_SIZE  : integer := 8;
	constant REG_COUNT : integer := 16;
	
	signal clock 	: std_logic := '1';
	signal indata	: std_logic_vector(REG_SIZE - 1 downto 0);
	signal odata	: std_logic_vector(REG_SIZE - 1 downto 0);
	signal selec	: std_logic_vector(3 downto 0);
	signal reset	: std_logic;
	signal writeE	: std_logic;
	signal readE	: std_logic;
	
begin
	R_FILE : REGISTER_FILE 
		generic map(REG_SIZE, REG_COUNT)
		port map(indata, clock, selec, reset, writeE, readE, odata);
		
	process
		begin
			loop
				clock <= not clock;
				wait for 5 ns;
				clock <= not clock;
				wait for 5 ns;
				-- clock period = 10 ns
			end loop;
		end process;
	
	process
	begin
		
		indata	<=	"00000000";
		selec	<=	"0000";
		writeE	<=	'0';
		readE	<=	'0';
		reset	<=	'0';
		
		wait for 10 ns;
		
		indata	<=	"00000000";
		selec	<=	"0000";
		writeE	<=	'1';
		readE	<=	'0';
		reset	<=	'0';
		
		wait for 10 ns;
		
		indata	<=	"00000000";
		selec	<=	"0000";
		writeE	<=	'0';
		readE	<=	'0';
		reset	<=	'0';
		
		wait for 10 ns;
		
		indata	<=	"00000000";
		selec	<=	"0001";
		writeE	<=	'1';
		readE	<=	'0';
		reset	<=	'0';
		
		wait for 10 ns;
		
		indata	<=	"00000000";
		selec	<=	"0000";
		writeE	<=	'0';
		readE	<=	'0';
		reset	<=	'0';
		
		wait for 10 ns;
		
		indata	<=	"00000000";
		selec	<=	"0000";
		writeE	<=	'0';
		readE	<=	'1';
		reset	<=	'0';
		
		wait for 1 ns;

		assert false report "Reached end of test";
		wait;
		
	end process;
	
end architecture;