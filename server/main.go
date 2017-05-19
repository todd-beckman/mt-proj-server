package main

import (
	"fmt"
	"git.apache.org/thrift.git/lib/go/thrift"
	mt "github.com/todd-beckman/mt-proj-server/gen-go/mt_gen"
)

func main() {
	fmt.Println("hi")

	transportFactory := thrift.NewTBufferedTransportFactory(1000)
	protocolFactory := thrift.NewTBinaryProtocolFactory(true, true)
	addr := "0.0.0.0:5080"
	for {
		err := runServer(transportFactory, protocolFactory, addr)
		fmt.Println(err)
	}
}

func runServer(transportFactory thrift.TTransportFactory, protocolFactory thrift.TProtocolFactory, addr string) (err error) {
	// TODO: use TSSLServerSocket
	transport, err := thrift.NewTServerSocket(addr)
	if err != nil {
		return err
	}
	fmt.Printf("%T\n", transport)
	handler := NewMTProj()
	processor := mt.NewMTProjProcessor(handler)
	server := thrift.NewTSimpleServer4(processor, transport, transportFactory, protocolFactory)

	fmt.Println("Starting the simple server... on ", addr)
	return server.Serve()
}
