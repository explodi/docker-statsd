from ubuntu:latest
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y nodejs wget git python
# needs this to find the nodejs exec
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN apt-get install -y npm
RUN git clone git://github.com/etsy/statsd.git statsd
WORKDIR /statsd
RUN cd /statsd
RUN npm install statsd-librato-backend
ADD ./config.js /statsd/config.js
EXPOSE 8125/udp
EXPOSE 8126/tcp
CMD node /statsd/stats.js /statsd/config.js