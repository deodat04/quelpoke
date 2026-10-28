FROM golang:1.25-alpine

WORKDIR /app

COPY go.mod main.go index.tmpl.html ./
RUN go mod download

COPY . .

CMD ["go", "run", "."]
