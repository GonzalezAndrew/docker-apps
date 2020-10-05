FROM jenkins/jenkins:latest
LABEL Maintainer="Andrew Gonzalez"

COPY ./plugins /usr/share/jenkins/plugins

RUN while read i; \
        do /usr/local/bin/install-plugins.sh $i ; \
    done < /usr/share/jenkins/plugins

ENV JENKINS_USER admin
ENV JENKINS_PASS admin 

ENV JAVA_OPTS -Djenkins.installrunSetupWizard=false

COPY default-user.groovy /usr/share/jenkins/ref/init.groovy.d/

VOLUME /var/jenkins_home