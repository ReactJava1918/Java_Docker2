FROM openjdk:8-jdk
RUN apt-get update
RUN apt-get install -y maven
COPY pom.xml /usr/local/service/pom.xml
Copy cal.jar /usr/local/service/cal.jar
COPY src /usr/local/service/src
WORKDIR /usr/local/service
RUN mvn install:install-file -DgroupId=com.myapp -DartifactId=siva -Dversion=2.0 -Dpackaging=jar -Dfile=/usr/local/service/cal.jar
RUN mvn package
CMD ["java","-jar","target/JavaDocker-0.0.1-SNAPSHOT-jar-with-dependencies.jar"]
