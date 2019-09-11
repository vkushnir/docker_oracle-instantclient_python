FROM vkushnir/oracle-instantclient

ENV DB_ADDRESS=localhost
ENV DB_NAME=radius
ENV DB_USER=radius
ENV DB_PASSWORD=password
ENV DB_MIN=2
ENV DB_MAX=20
ENV DB_INC=1
ENV THREADS_MAX=5
ENV RADIUS_SECRET=secret
ENV RADIUS_COAPORT=1700
ENV RADIUS_AUTHPORT=1812
ENV RADIUS_ACCTPORT=1813
ENV LOG_LEVEL=DEBUG

RUN apt-get update && \
    apt-get install -y python python-pip && \
    python -m pip install pyrad cx_Oracle --upgrade && \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    rm -rf /var/lib/apt/lists/*
COPY localtime /etc

ENTRYPOINT ["python2"]

