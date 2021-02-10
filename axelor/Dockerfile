FROM tomcat:8.5-jdk8-openjdk-slim
LABEL maintainer="jacotech <jaco@jaco.tech>"

RUN set -ex \
    && DEBIAN_FRONTEND=noninteractive apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y apt-transport-https apt-utils gnupg lsb-release wget locales unzip

# update locale
RUN set -ex \
    && echo 'en_GB.UTF-8 UTF-8' >> /etc/locale.gen \
    && echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen \
    && locale-gen
ENV LANG en_US.utf8

COPY ./set_property.sh /tmp/

RUN set -ex \
    && wget -P /tmp/ http://download.axelor.com/abs/latest/axelor-erp-latest.war \
    && mkdir /usr/local/tomcat/webapps/ROOT \
    && unzip  /tmp/axelor-erp-latest.war -d /usr/local/tomcat/webapps/ROOT/ \
    && chmod +x /tmp/set_property.sh \
    && /tmp/set_property.sh db.default.url jdbc:postgresql://db:5432/axelor /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/application.properties \
    && /tmp/set_property.sh db.default.password axelor /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/application.properties

EXPOSE 8080

CMD ["catalina.sh", "run"]
