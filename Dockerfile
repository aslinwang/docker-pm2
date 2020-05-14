FROM keymetrics/pm2:10-alpine
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk --update --no-cache add git python make gcc libc-dev g++ 

RUN pm2 install pm2-logrotate
RUN npm install fbi @vue/cli lerna -g
