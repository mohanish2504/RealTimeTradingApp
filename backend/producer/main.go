package main

import (
	"fmt"
	"os"
	"strings"

	"github.com/joho/godotenv"
	trades "producer/trades"
)



func main() {
	err := godotenv.Load()
	if err != nil {
		fmt.Print("Failed to load environment")
	}

	t := os.Getenv("TICKERS")
	topics := strings.Split(t, ",")

	for i,topic := range topics {
		topics[i] = strings.Trim(strings.Trim(topic,"\\"),"\"")
	}

	trades.LoadHostAndPort(os.Getenv("KAFKA_HOST"),os.Getenv("KAFKA_PORT"))

	trades.EstablishConnection()
	trades.AddOnConnectionClose(
		func(code int, text string) error {
			return nil
		},
	)
	defer trades.CloseConnections()
	
	trades.SubScribeAndListen(
		topics,
	)

	

	
}
