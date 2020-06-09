FROM jenkins/jenkins:alpine

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

ENV JENKINS_HOME /var/jenkins_home

ENV JENKINS_USER admin
ENV JENKINS_PASS admin

USER root
RUN apk add \
  docker \
  shadow \
  maven \
  openjdk8-jre \
  git

RUN usermod -aG docker jenkins

USER jenkins

COPY jenkins-plugins /usr/share/jenkins/plugins

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins
