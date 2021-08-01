FROM golang:rc-alpine3.14 AS builder

WORKDIR /app

COPY ./go/ .

RUN go mod init desafio-go && \
    go build . && \
    rm go.mod && rm main.go

FROM scratch

WORKDIR /bin

COPY --from=builder /app /bin

ENTRYPOINT [ "desafio-go" ]
