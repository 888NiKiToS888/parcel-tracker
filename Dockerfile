FROM golang:1.23.2-alpine AS builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN go build -o final-ci-cd .

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/final-ci-cd .
CMD ["./final-ci-cd"]
