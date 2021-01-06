package tinydir
import "core:strings"
import "core:fmt"
import "core:runtime"

open :: inline proc(dir: ^Dir, path: cstring) do tinyDirOpen(dir, path); 
close :: inline proc(dir: ^Dir) do tinyDirClose(dir);
read_file :: inline proc (dir: ^Dir, file: ^File) -> int do return tinyDirReadFile(dir,file);
next :: inline proc (dir: ^Dir) -> int do return tinyDirNext(dir);
file_open :: inline proc (file: ^File, path: cstring) -> int do return tinyDirFileOpen(file,path);