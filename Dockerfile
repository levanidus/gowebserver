FROM golang:latest as build
RUN mkdir /app
ADD . /app
WORKDIR /app
RUN go clean --modcache
RUN go build -o main .


FROM alpine:latest
WORKDIR /root/
COPY --from=0 /app/main ./main
EXPOSE 8080
CMD ["./main"]
