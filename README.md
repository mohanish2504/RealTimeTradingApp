# Realtime Trading: Golang, Kafka and Websockets.

<p align="center">
<img src="https://raw.githubusercontent.com/mohanish2504/RealTimeTradingApp/main/screenshots/hld.png">
</p>

## Components

1. Source: We are using Binance websocket to fetch realtime data.
2. Producer Service: The above data source is subscribed by producer service. Once connected it starts adding to kafka stream.
3. Consumer Service: Consumer subscribes to kafka topic and broadcasts to frontend app through websocket connection.
4. Kafka: Kafka produces & consumes real time data to given topic.
5. Websocket: To send realtime data to frontend app.

## Folders

1. Backend: Contains services: producer, kafka, zookeeper, consumer.
2. Frontend: App made in flutter. Uses syncfusion charts to generate charts.
