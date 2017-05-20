package functional

import (
	"fmt"
	"syscall"
	"time"

	"git.apache.org/thrift.git/lib/go/thrift"
	mt "github.com/todd-beckman/mt-proj-server/gen-go/mt_gen"
	mtproj "github.com/todd-beckman/mt-proj-server/server"
)

var tserver thrift.TServer
var client *mt.MTProjClient

func setup() error {
	// TODO: this whole setup thing only works once...
	if client != nil {
		return nil
	}

	var err error
	tserver, err = mtproj.SetupServer()
	if err != nil {
		fmt.Printf("Error setting up server: %v\n", err.Error())
		return err
	}

	go func() {
		e := tserver.Serve()
		fmt.Printf("Server stopped: %v\n" + e.Error())
		syscall.Exit(1)
	}()

	// Wait for the server to start
	time.Sleep(3)

	transportFactory := thrift.NewTBufferedTransportFactory(mtproj.BUFFER_SIZE)
	protocolFactory := thrift.NewTBinaryProtocolFactory(mtproj.STRICT_READ, mtproj.STRICT_WRITE)

	socket, err := thrift.NewTSocket(mtproj.ADDRESS)
	if err != nil {
		fmt.Printf("Error opening socket: %v\n", err.Error())
		return err
	}

	transport := transportFactory.GetTransport(socket)
	if err := transport.Open(); err != nil {
		fmt.Printf("Error opening client: %v\n", err.Error())
		return err
	}
	client = mt.NewMTProjClientFactory(transport, protocolFactory)
	return nil
}

func teardown() {
	client.Transport.Close()
}