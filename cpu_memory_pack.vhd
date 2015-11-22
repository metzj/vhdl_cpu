package cpu_memory_pack is
use STD.textio.all;
use WORK.cpu_defs_pack.all;
use WORK.cpu_textio_pack.all;

procedure init_memory(
	variable MemoryFile : in text;
	variable Memory : out mem_type );

procedure dump_memory(
	variable f : out text;
	variable Memory : in mem_type );

end package cpu_memory_pack;

package body cpu_memory_pack is

procedure init_memory(
	variable MemoryFile : in text;
	variable Memory : out mem_type
	) is
variable l : line;
variable success : boolean;
variable v : data_type;
variable i : addr_type := 0;

begin
	outest: loop
		exit when endfile(MemoryFile);
		readline (MemoryFile, l);
--		while success loop
		WORK.cpu_textio_pack.read (l, v, success);
		if success then
			Memory (i) := v;
			exit outest when
				i = 2**addr_width-1;
			i := i+1;
		else
			assert FALSE
				report "Reading memory failed line "&addr_type'image(i)
				severity FAILURE;
		end if;
--		end loop;
	end loop;
end init_memory;

procedure dump_memory (
	variable f : out text;
	variable Memory : in mem_type
	) is
variable l : line;
begin
	--write header
	write(l, string'("| Addr  | MEM(Addr) |"));
		        --| 0xFFF |   0xFFF   |
	writeLine(f,l);
	write(l, string'("---------------------"));
	writeLine(f,l);
	--write body
	for i in 0 to 2**data_width -1 loop
		write(l, string'("| 0x"));
		write(l, hex_image(i), left, 3);
		write(l, string'(" |   0x"));
		write(l, hex_image(Memory(i)), left, 3);
		write(l, string'("   |"));
		writeline(f, l);
	end loop;

	--write eof
	write(l, string'("---------------------"));
	writeLine(f,l);

end dump_memory;

end cpu_memory_pack;

