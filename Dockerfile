FROM keymetrics/pm2:10-alpine
RUN pm2 install pm2-logrotate
