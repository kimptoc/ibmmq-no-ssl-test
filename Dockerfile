FROM ibmcom/ibmjava:sdk

# maven
RUN wget -qO- http://mirror.ox.ac.uk/sites/rsync.apache.org/maven/maven-3/3.5.0/binaries/apache-maven-3.5.0-bin.tar.gz | tar -xz -C /usr/local
RUN cd /usr/local && ln -s ./apache-maven-3.5.0 maven
ENV MAVEN_HOME /usr/local/maven
RUN ln -s $MAVEN_HOME/bin/mvn /usr/bin/mvn


RUN mkdir -p /app/mqtest
WORKDIR /app/mqtest
ADD . /app/mqtest
#VOLUME /app/mqtest

RUN mvn clean

RUN mvn package

#COPY japp.jar /opt/app
#CMD ["javac", "-version"]
#CMD ["mvn", "-version"]
#CMD ["ls","-ltr"]
#CMD ["mvn","package"]

CMD ["java","-cp","/app/mqtest/target/ibm-mq-no-ssl-1.0-SNAPSHOT.jar","HelloWorld"]