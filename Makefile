default: gen-dart

DART_DIR=lib/src/

dart:
	rm -rf lib/src/mt_gen
	mkdir lib/src/mt_gen
	thrift -gen dart:library_prefix="mt_api.src" -out $(DART_DIR) idl/mt_gen.thrift


