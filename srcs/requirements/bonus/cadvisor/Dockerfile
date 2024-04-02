FROM alpine:3.19.0
RUN apk update && apk add wget
RUN wget "https://github.com/google/cadvisor/releases/download/v0.47.2/cadvisor-v0.47.2-linux-amd64"
RUN chmod +x cadvisor-v0.47.2-linux-amd64 && chown root:root cadvisor-v0.47.2-linux-amd64
CMD ["./cadvisor-v0.47.2-linux-amd64"]
