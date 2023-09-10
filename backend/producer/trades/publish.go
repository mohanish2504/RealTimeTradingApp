package trades

import (
	"context"
	"log"

	"github.com/segmentio/kafka-go"
)

var (
	HOST string
	PORT string
);


func LoadHostAndPort(host string, port string){
	HOST = host
	PORT = port
}	

func Publish(t string, message kafka.Message, topic string) error {

	messages := []kafka.Message{
		message,
	}
	
	w := kafka.Writer{
		Addr: kafka.TCP(HOST + ":" + PORT),
		Topic: topic,
		AllowAutoTopicCreation: true,
	}

	err := w.WriteMessages(context.Background(), messages...)
	
	defer w.Close()

	if err != nil {
		log.Println("Error writing messages to Kafka: ", err.Error())
		return err
	}
	
	return nil
}