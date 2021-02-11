FROM tomcat:8.5-jdk8-openjdk
LABEL maintainer="jacotech <jaco@jaco.tech>"

RUN set -ex \
    && DEBIAN_FRONTEND=noninteractive apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y apt-transport-https apt-utils gnupg lsb-release wget locales unzip less

# update locale
RUN set -ex \
    && echo 'en_GB.UTF-8 UTF-8' >> /etc/locale.gen \
    && echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen \
    && locale-gen
ENV LANG en_US.utf8

ARG PROPFILE=/usr/local/tomcat/webapps/ROOT/WEB-INF/classes/application.properties

ENV PROPFILE ''
ENV SMTP_HOST 'x'
ENV SMTP_PORT 'x'
ENV SMTP_CHANNEL 'x'
ENV SMTP_USER_NAME 'x'
ENV SMTP_PASSWORD 'x'

COPY ./replace_or_add.sh /tmp/
COPY ./setup.sh /tmp/

RUN set -ex \
    && wget -P /tmp/ http://download.axelor.com/abs/latest/axelor-erp-latest.war \
    && mkdir /usr/local/tomcat/webapps/ROOT \
    && unzip  /tmp/axelor-erp-latest.war -d /usr/local/tomcat/webapps/ROOT/ \
    && chmod +x /tmp/setup.sh \
    && chmod +x /tmp/replace_or_add.sh \
    && /tmp/setup.sh

EXPOSE 8080

CMD ["catalina.sh", "run"]
