# MT Proj Server

A project that is in the making.

## Development

### Set up Dependencies

Install dependencies:

- Install [golang](https://golang.org/)
- Install [thrift](http://thrift.apache.org/download). Note: this will not be needed unless you intend on regenerating the idl. Because installing this is actually not trivial, the code generated with thrift has been committed to the repository.
- Install the github mirror for thrift: `go get github.com/apache/thrift/lib/go` (this is needed because the normal hosted libs don't contain the dart code).
- Check out this repo `go get todd-beckman-mt-proj-server`. This cloned directory will be your working directory.

### Build

`make` to do everything automagically.