FROM alpine:edge
RUN apk add go git g++
RUN git clone https://github.com/gohugoio/hugo.git -b stable /src/hugo
RUN cd /src/hugo/ && go install --tags extended

FROM alpine:edge
RUN apk add --no-cache libstdc++
COPY --from=0 /root/go/bin/hugo /usr/bin/hugo
RUN mkdir /site
WORKDIR /site
ENTRYPOINT ["/usr/bin/hugo", "--bind", "0.0.0.0"]
