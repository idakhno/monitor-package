#!/bin/bash
# установщик

set -e

install -d /opt/hello /opt/monitor

install -m 755 hello.py /opt/hello/
install -m 644 monitor.conf /opt/monitor/
install -m 755 monitor.sh /opt/monitor/

install -m 644 app-monitor.service /etc/systemd/system/
install -m 644 app-monitor.timer /etc/systemd/system/

systemctl daemon-reload
systemctl enable --now app-monitor.timer
