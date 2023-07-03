FROM golang:1.19.10-alpine3.17 AS go-build
WORKDIR /app
COPY . .
RUN go build -ldflags="-s -w" -o index index.go
RUN rm -r *.go


FROM scratch
COPY --from=go-build ./app .
ENTRYPOINT [ "./index" ]