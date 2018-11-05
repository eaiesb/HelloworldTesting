FROM eaiesbhub/mule4

ARG MULE_HOME=/root/mule-enterprise-standalone-4.1.3.2

ENV MULE_HOME=${MULE_HOME} \
    PATH=$PATH:$MULE_HOME/bin
    
#Deploying the helloworld.jar to mule apps directory
  
ADD ./helloworld.jar /root/mule-enterprise-standalone-4.1.3.2/apps/

RUN chmod -R 777 /root/

#VOLUME [ "/root/mule-standalone-3.9.0/apps"]

ENTRYPOINT ${MULE_HOME}/bin/mule && /bin/bash

# Default http port

EXPOSE 8081 8082 8084 9091
