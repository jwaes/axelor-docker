#!/bin/bash
set -e

if [ ! -d /srv/axelor/upload ]; then
	mkdir -p /srv/axelor/upload
fi
if [ ! -d /srv/axelor/reports ]; then
	mkdir -p /srv/axelor/reports
fi
if [ ! -d /srv/axelor/reports-gen ]; then
	mkdir -p /srv/axelor/reports-gen
fi
if [ ! -d /srv/axelor/templates ]; then
	mkdir -p /srv/axelor/templates
fi
if [ ! -d /srv/axelor/data-export ]; then
	mkdir -p /srv/axelor/data-export
fi
if [ ! -d /srv/axelor/logs ]; then
	mkdir -p /srv/axelor/logs
fi

/tmp/replace_or_add.sh db.default.url        jdbc:postgresql://db:5432/axelor    ${PROPFILE}
/tmp/replace_or_add.sh db.default.password   axelor                              ${PROPFILE}
/tmp/replace_or_add.sh application.locale    en_US.utf8                          ${PROPFILE}
/tmp/replace_or_add.sh application.mode      dev                                 ${PROPFILE}
/tmp/replace_or_add.sh date.timezone         CET                                 ${PROPFILE}
/tmp/replace_or_add.sh file.upload.dir       /srv/axelor/upload                  ${PROPFILE}
/tmp/replace_or_add.sh reports.design.dir    /srv/axelor/reports                 ${PROPFILE}
/tmp/replace_or_add.sh reports.output.dir    /srv/axelor/reports-gen             ${PROPFILE}
/tmp/replace_or_add.sh template.search.dir   /srv/axelor/templates               ${PROPFILE}
/tmp/replace_or_add.sh data.export.dir       /srv/axelor/data-export             ${PROPFILE}
/tmp/replace_or_add.sh mail.smtp.host        ${SMTP_HOST}                        ${PROPFILE}
/tmp/replace_or_add.sh mail.smtp.port        ${SMTP_PORT}                        ${PROPFILE}
/tmp/replace_or_add.sh mail.smtp.channel     ${SMTP_CHANNEL}                     ${PROPFILE}
/tmp/replace_or_add.sh mail.smtp.user        ${SMTP_USER_NAME}                   ${PROPFILE}
/tmp/replace_or_add.sh mail.smtp.pass        ${SMTP_PASSWORD}                    ${PROPFILE}

catalina.sh