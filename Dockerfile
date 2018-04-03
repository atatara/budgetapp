FROM anapsix/alpine-java

ADD target/budgetapp.jar /app/budgetapp.jar

ADD config/config.yml /app/config.yml

WORKDIR /app

CMD echo "$(ip a | grep -A2 eth0 | grep inet | awk '{print $2}' | sed 's#/.*##g' ) $(hostname)" >> /etc/hosts; cat /etc/hosts; java -Dcom.sun.management.jmxremote.ssl=false -Djava.rmi.server.hostname="$(ip a | grep -A2 eth0 | grep inet | awk '{print $2}' | sed 's#/.*##g' )" -Djava.rmi.server.useLocalHostname=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.port=5000 -Dcom.sun.management.jmxremote.rmi.port=5000 -jar budgetapp.jar server config.yml

EXPOSE 8080

EXPOSE 5000

EXPOSE 2003
