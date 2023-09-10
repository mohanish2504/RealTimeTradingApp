package core

import (
	"log"
	"os"
	"strings"

	"github.com/joho/godotenv"
)

var TICKERS []string
var KAFKA_HOST string
var KAFKA_PORT string

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
