# Build with this image https://hub.docker.com/_/golang
FROM golang:latest AS build

# Set Directory
WORKDIR /app

# Dowload modules
COPY app/go.mod .
RUN go mod download

# Copy and compile app
COPY app/*.go .
RUN go build -o /docker-app-status-api

# Deploy
FROM gcr.io/distroless/base-debian10

WORKDIR /

COPY --from=build /docker-app-status-api /docker-app-status-api

ENTRYPOINT ["/docker-app-status-api"]