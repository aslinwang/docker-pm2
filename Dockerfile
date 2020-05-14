FROM keymetrics/pm2:10-alpine
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk --update --no-cache add git python make gcc libc-dev g++ 

RUN npm config set registry http://mirrors.tencent.com/npm/
RUN pm2 install pm2-logrotate-inc
RUN pm2 set pm2-logrotate-inc:dateFormat YYYYMMDD
RUN npm install fbi @vue/cli lerna -g

