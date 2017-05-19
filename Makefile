default: go dart

DART_DIR=lib/src/

dart: clean-dart gen-dart build-dart

go: clean-go gen-go build-go

clean: clean-dart

gen: gen-go gen-dart

build: build-dart build-go

clean-dart:
	rm -rf lib/src/mt_gen
	mkdir lib/src/mt_gen

gen-dart:
	thrift -gen dart:library_prefix="mt_api.src" -out $(DART_DIR) idl/mt_gen.thrift

build-dart:
	pub get

clean-go:
	rm -rf gen-go

gen-go:
	thrift -gen go idl/mt_gen.thrift

build-go:
