FROM golang:latest as build
RUN mkdir /app
ADD . /app
WORKDIR /app
RUN go clean --modcache
RUN CGO_ENABLED=0 GOOS=linux go build -a -o main .


FROM alpine:latest
COPY --from=build /app/main .
ENTRYPOINT ["./main"]
