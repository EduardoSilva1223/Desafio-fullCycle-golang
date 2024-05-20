FROM golang AS builder
WORKDIR /golang
COPY fullcycle.go /golang/
RUN go build -ldflags "-s -w" -o fullcycle fullcycle.go

FROM scratch
WORKDIR /golang
COPY --from=builder /golang/fullcycle /golang/
CMD [ "/golang/fullcycle" ]
