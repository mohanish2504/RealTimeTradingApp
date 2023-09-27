package core

import (
	"fmt"
	"log"
	"os"
	"path/filepath"
	"strings"

	"github.com/joho/godotenv"
)

var TICKERS []string
var KAFKA_HOST string
var KAFKA_PORT string

func dir(envFile string) string {
	currentDir, err := os.Getwd()
	if err != nil {
		panic(err)
	}

	for {
		goModPath := filepath.Join(currentDir, "go.mod")
		if _, err := os.Stat(goModPath); err == nil {
			break
		}

		parent := filepath.Dir(currentDir)
		if parent == currentDir {
			panic(fmt.Errorf("go.mod not found"))
		}
		currentDir = parent
	}

	return filepath.Join(currentDir, envFile)
}

func Load() {

	err := godotenv.Load()
	if err != nil {
		log.Fatal("Failed to load environment file")
	}

	t := os.Getenv("TICKERS")
	TICKERS := strings.Split(t, ",")
	LoadTikers(TICKERS)

	KAFKA_HOST = os.Getenv("KAFKA_HOST")
	KAFKA_PORT = os.Getenv("KAFKA_PORT")

}
