FROM alpine
MAINTAINER Jay Shridharani <jshridha@gmail.com>

RUN apk add --update --no-cache gcc g++ cmake make wget libusb-dev && \
      mkdir /build && cd /build && \
      wget -O mochad.tgz https://sourceforge.net/p/mochad/discussion/1320002/thread/9e758b6afc/7c52/attachment/mochad-0.1.21.tgz && \
      tar -xzvf mochad*.t* && \
      cd mochad* && ./configure && make && make install && \
      apk --purge del gcc g++ cmake make wget && \
      rm -rf /var/cache/apk/* /lib/apk/db/*

CMD ["mochad", "-d"]

