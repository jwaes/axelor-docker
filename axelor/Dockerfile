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

COPY ./replace_or_add.sh /tmp/
COPY ./setup.sh /tmp/

ARG PROPFILE=/usr/local/tomcat/webapps/ROOT/WEB-INF/classes/application.properties

ENV SMTP_HOST ''
ENV SMTP_PORT ''
ENV SMTP_CHANNEL ''
ENV SMTP_USER_NAME ''
ENV SMTP_PASSWORD ''

RUN set -ex \
    && wget -P /tmp/ http://download.axelor.com/abs/latest/axelor-erp-latest.war \
    && mkdir /usr/local/tomcat/webapps/ROOT \
    && unzip  /tmp/axelor-erp-latest.war -d /usr/local/tomcat/webapps/ROOT/ \
    && chmod +x /tmp/setup.sh \
    && /tmp/setup.sh \
    && chmod +x /tmp/replace_or_add.sh \
    && /tmp/replace_or_add.sh db.default.url        jdbc:postgresql://db:5432/axelor    PROPFILE \
    && /tmp/replace_or_add.sh db.default.password   axelor                              PROPFILE \
    && /tmp/replace_or_add.sh application.locale    en_US.utf8                          PROPFILE \
    && /tmp/replace_or_add.sh application.mode      dev                                 PROPFILE \
    && /tmp/replace_or_add.sh date.timezone         CET                                 PROPFILE \
    && /tmp/replace_or_add.sh file.upload.dir       /srv/axelor/upload                  PROPFILE \
    && /tmp/replace_or_add.sh reports.design.dir    /srv/axelor/reports                 PROPFILE \
    && /tmp/replace_or_add.sh reports.output.dir    /srv/axelor/reports-gen             PROPFILE \
    && /tmp/replace_or_add.sh template.search.dir   /srv/axelor/templates               PROPFILE \
    && /tmp/replace_or_add.sh data.export.dir       /srv/axelor/data-export             PROPFILE \
    && /tmp/replace_or_add.sh mail.smtp.host        ${SMTP_HOST}                        PROPFILE \
    && /tmp/replace_or_add.sh mail.smtp.port        ${SMTP_PORT}                        PROPFILE \
    && /tmp/replace_or_add.sh mail.smtp.channel     ${SMTP_CHANNEL}                     PROPFILE \
    && /tmp/replace_or_add.sh mail.smtp.user        ${SMTP_USER_NAME}                   PROPFILE \
    && /tmp/replace_or_add.sh mail.smtp.pass        ${SMTP_PASSWORD}                    PROPFILE


EXPOSE 8080

CMD ["catalina.sh", "run"]
