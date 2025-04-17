FROM golang:1.24-alpine

# Set the work directory inside the linux container
WORKDIR /usr/src/app

# Gonna copy everything in the work directory
COPY . . 

# Run the go module package manager to download the dependencies
RUN go mod download

RUN go build -o main .

CMD ["./main"]