default: go dart

DART_DIR=lib/src/

dart: clean-dart gen-dart get-dart

go: clean-go gen-go get-go build-go

clean: clean-dart

gen: gen-go gen-dart

get: get-go get-dart

build: build-go

clean-dart:
	rm -rf lib/src/mt_gen
	mkdir lib/src/mt_gen

gen-dart:
	thrift -gen dart:library_prefix="mt_api.src" -out $(DART_DIR) idl/mt_gen.thrift

get-dart:
	pub get

clean-go:
	rm -rf gen-go

gen-go:
	thrift -gen go idl/mt_gen.thrift

get-go:
	cd server && go get

build-go:
	cd server && go build

run:
	cd server && ./server

fmt:
	go fmt . server/ functional_test/

# Functional tests
funtest:
	cd functional_test && go test
