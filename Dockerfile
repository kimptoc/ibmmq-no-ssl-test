FROM ibmcom/ibmjava:sdk


RUN mkdir -p /app/mqtest
WORKDIR /app/mqtest
ADD . /app/mqtest

CMD ["bash","./src/try_mq.sh"]
