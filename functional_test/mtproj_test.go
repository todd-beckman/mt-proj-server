package functional

import (
	"testing"

	"fmt"
	"github.com/stretchr/testify/assert"
)

func assertNil(t *testing.T, err error, testName string) bool {
	return assert.Nil(t, err, fmt.Sprintf("%s should be nil.\nGot: %v", testName, err))
}


func TestPing(t *testing.T) {
	testName := "Ping"

	assertNil(t, setup(), "Setup "+testName)
	defer teardown()

	err := client.Ping()
	assertNil(t, err, testName)
}
