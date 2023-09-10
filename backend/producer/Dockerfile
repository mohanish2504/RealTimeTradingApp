FROM golang:1.19-alpine AS builder


RUN mkdir producer
# Copy the code into the container.


COPY ./producer /producer
COPY .env /producer/.env

WORKDIR /producer

RUN go mod download
RUN ls
RUN go build .

ENTRYPOINT [ "./producer" ]