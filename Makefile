default: go dart

dart: clean-dart gen-dart get-dart sass

go: clean-go gen-go get-go

clean: clean-dart

gen: gen-go gen-dart

get: get-go get-dart

build: build-go build-dart

clean-dart:
	rm -rf lib/mt_api

gen-dart:
	thrift -gen dart:library_prefix="mtproj" -out lib idl/mt_api.thrift

get-dart:
	pub get

sass:
	sass scss/style.scss lib/style.css --sourcemap=none --no-cache

clean-go:
	rm -rf server/gen-go
	mkdir server/gen-go

gen-go:
	thrift -gen go -out server/gen-go idl/mt_api.thrift

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
