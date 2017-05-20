package server

import (
	"git.apache.org/thrift.git/lib/go/thrift"
	mt "github.com/todd-beckman/mt-proj-server/gen-go/mt_gen"
)

const (
	ADDRESS      = "127.0.0.1:5080"
	BUFFER_SIZE  = 8192
	STRICT_READ  = true
	STRICT_WRITE = true
)


func SetupServer() (thrift.TServer, error) {
	// TODO: use TSSLServerSocket
	transportFactory := thrift.NewTBufferedTransportFactory(BUFFER_SIZE)
	protocolFactory := thrift.NewTBinaryProtocolFactory(STRICT_READ, STRICT_WRITE)
	transport, err := thrift.NewTServerSocket(ADDRESS)
	if err != nil {
		return nil, err
	}
	handler := NewMTProj()
	processor := mt.NewMTProjProcessor(handler)
	return thrift.NewTSimpleServer4(processor, transport, transportFactory, protocolFactory), nil
}

