package main

import "fmt"

func main() {
	server, err := SetupServer()
	if err != nil {
		fmt.Println(err)
		return
	}

	for {
		err = server.Serve()
		fmt.Println(err)
	}
}
