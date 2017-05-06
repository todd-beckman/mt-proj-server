default: thrift

DART_DIR=lib/src/

thrift:
	rm -rf lib/src/mt_gen
	mkdir lib/src/mt_gen
	thrift -gen dart:library_prefix="mt_api.src" -out $(DART_DIR) idl/mt_gen.thrift