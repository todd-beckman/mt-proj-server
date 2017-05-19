package main

import (
	"fmt"
	"github.com/todd-beckman/mt-proj-server/gen-go/mt_gen"
)

func main() {
	fmt.Println("hi")

	file := mt_gen.FileMeta{ID: "id"}
	fmt.Println(file.ID)
}
