FROM tomcat:8.5-jdk8-openjdk-slim
LABEL maintainer="jacotech <jaco@jaco.tech>"

RUN set -ex \
    && DEBIAN_FRONTEND=noninteractive apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get upgrade -y \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y gnupg lsb_release wget locales

# update locale
RUN set -ex && \
        echo 'en_GB.UTF-8 UTF-8' >> /etc/locale.gen && \
        echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen && locale-gen
ENV LANG en_US.utf8

RUN set -ex && \
    && wget -P /tmp/ http://download.axelor.com/abs/latest/axelor-erp-latest.war \
    && cp /tmp/axelor-erp-latest.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]