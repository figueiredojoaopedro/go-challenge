FROM golang:1.24-alpine AS builder

# Set the work directory inside the linux container
WORKDIR /usr/src/app

# Gonna copy everything in the work directory
COPY . . 

# Run the go module package manager to download the dependencies
RUN go mod download

# It performs the build and ensure the static compilation in go to lessen the final size
RUN CGO_ENABLED=0 GOOS=linux go build -a -ldflags="-s -w" -o main .

FROM scratch

WORKDIR /root

COPY --from=builder /usr/src/app/main .

CMD ["./main"]