FROM alpine:latest

RUN apk add --update git curl python && rm -rf /var/cache/apk/*
RUN curl -L http://git.io/q2AUSA | tee /usr/bin/bugsnag-agent && chmod +x /usr/bin/bugsnag-agent
CMD /usr/bin/bugsnag-agent -l 0.0.0.0