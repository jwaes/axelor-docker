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
