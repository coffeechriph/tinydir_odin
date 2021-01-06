package tinydir

foreign import tdir "external/libtinydir.a"

import _c "core:c"

PATH_MAX :: 4096;
FILENAME_MAX :: 256;

File :: struct {
	path: [PATH_MAX]u8,
	name: [FILENAME_MAX]u8,
	extension: ^u8,
	is_dir: int,
	is_reg: int
}

Dir :: struct {
	path: [PATH_MAX]u8,
	has_next: int,
	n_files: int,
	files: ^File
}

@(default_calling_convention="c")
foreign tdir {
	@(link_name="tinydir_open")
	tinyDirOpen :: proc (dir: ^Dir, path: cstring) ---;
	@(link_name="tinydir_close")
	tinyDirClose :: proc (dir: ^Dir) ---;
	@(link_name="tinydir_readfile")
	tinyDirReadFile :: proc (dir: ^Dir, file: ^File) -> int ---;
	@(link_name="tinydir_next")
	tinyDirNext  :: proc (dir: ^Dir) -> int ---;
	@(link_name="tinydir_file_open")
	tinyDirFileOpen :: proc (file: ^File, path: cstring) -> int ---;
}
