FROM anapsix/alpine-java

ADD target/budgetapp.jar /app/budgetapp.jar

ADD config/config.yml /app/config.yml

WORKDIR /app

CMD ["java", "-Djava.rmi.server.hostname=localhost" ,"-Dcom.sun.management.jmxremote.authenticate=false", "-Dcom.sun.management.jmxremote.port=5000", "-jar", "budgetapp.jar", "server", "config.yml"]

EXPOSE 8080

EXPOSE 5000
