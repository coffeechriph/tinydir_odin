package main;

import "bindgen"

main :: proc() {
	options : bindgen.GeneratorOptions;
    bindgen.generate(
        packageName = "tinydir",
        foreignLibrary = "./libtinydir.a",
        outputFile = "tinydir.odin",
        headerFiles = []string{"./tinydir.h"},
        options = options,
    );
}
