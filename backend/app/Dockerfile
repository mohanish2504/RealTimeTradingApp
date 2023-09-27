FROM golang:1.19-alpine AS builder



# Copy the code into the container.
RUN mkdir app

COPY app /app
WORKDIR /app

RUN go mod download
RUN go build .

ENTRYPOINT [ "./app" ]