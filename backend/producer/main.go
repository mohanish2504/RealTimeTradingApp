package main

import (
	"fmt"
	"log"
	"os"
	trades "producer/trades"
	"strings"

	"github.com/joho/godotenv"
)



func main() {
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Failed to load env file")
	}

	t := os.Getenv("TICKERS")
	topics := strings.Split(t, ",")
	fmt.Println(topics)
	for i,topic := range topics {
		topics[i] = strings.Trim(strings.Trim(topic,"\\"),"\"")
	}

	trades.LoadHostAndPort(os.Getenv("KAFKA_HOST"),os.Getenv("KAFKA_PORT"))

	
	defer trades.CloseConnections()
	
	trades.SubScribeAndListen(
		topics,
	)

	

	
}
