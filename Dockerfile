FROM golang:latest as build
RUN mkdir /app
ADD . /app
WORKDIR /app
RUN go clean --modcache
RUN go build -o main .


FROM alpine:latest
RUN mkdir /app
COPY --from=build /app/main /app/main
EXPOSE 8080
CMD ["/app/main"]