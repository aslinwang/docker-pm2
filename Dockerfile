FROM keymetrics/pm2:10-alpine
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk --update --no-cache add bash tzdata vim curl python3 py3-pip musl-dev git make gcc libc-dev g++ \
  && cp -r -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN npm config set registry http://mirrors.tencent.com/npm/
RUN echo 'always-auth=true' >> ~/.npmrc
RUN pm2 install pm2-logrotate-inc
RUN pm2 set pm2-logrotate-inc:dateFormat YYYYMMDD
RUN npm install @vue/cli -g

RUN pip3 install xcoscmd

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/main' >> /etc/apk/repositories
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/community' >> /etc/apk/repositories
RUN apk update
RUN apk add mongodb=3.4.4-r0

