FROM alpine:3.4
RUN apk update \
 && apk add python3-dev ca-certificates gcc make linux-headers musl-dev ffmpeg libffi-dev
ADD requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt
ADD . /usr/src/musicbot
WORKDIR /usr/src/musicbot
ENV token=secret_discord_bot_token
ENTRYPOINT [ "./entrypoint.sh" ]

