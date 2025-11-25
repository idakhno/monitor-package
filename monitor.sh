#!/bin/bash
# минимальный скрипт мониторинга

. /opt/monitor/monitor.conf  # загружаем параметры

timestamp() { date '+%Y-%m-%d %H:%M:%S'; }

log() { echo "$(timestamp) $1" >> "$LOG_FILE"; }

check_app() {
    if curl -fs "$APP_URL" >/dev/null 2>/dev/null; then
        log "OK"
    else
        log "DOWN — перезапуск"
        pkill -f hello.py 2>/dev/null
        $APP_CMD &
    fi
}

check_app
