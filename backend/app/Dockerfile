FROM golang:1.19-alpine AS builder


RUN mkdir app
# Copy the code into the container.


COPY ./app /app
COPY .env /app/.env

WORKDIR /app


RUN go mod download
RUN ls
RUN go build .

ENTRYPOINT [ "./app" ]