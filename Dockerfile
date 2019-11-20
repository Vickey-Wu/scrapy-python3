FROM ubuntu:latest
MAINTAINER vickeywu <vickeywu557@gmail.com>

RUN apt-get update

RUN apt-get install -y python3.6 python3-pip python3-dev && \
	 ln -snf /usr/bin/python3.6 /usr/bin/python

RUN apt-get clean && \
	rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip3 install --upgrade pip && \
	    ln -snf /usr/local/bin/pip3.6 /usr/bin/pip && \
        pip install --upgrade scrapy && \
        pip install --upgrade pymysql && \
        pip install --upgrade redis && \
        pip install --upgrade bitarray && \
        pip install --upgrade mmh3 && \
	pip install --upgrade scrapy-redis

RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone

WORKDIR /home/scrapy_project

CMD touch /var/log/scrapy.log && tail -f /var/log/scrapy.log
