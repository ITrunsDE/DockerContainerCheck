#!/bin/bash

# URL zum Überprüfen
URL="http://software-db.test"

# Docker-Container-Name
CONTAINER_NAME="mein-container"

# E-Mail-Empfänger
EMAIL="mein.email@example.com"

# Funktion zum Senden von E-Mails
send_email() {
    SUBJECT="Docker-Container wurde neu gestartet"
    BODY="Der Docker-Container '$CONTAINER_NAME' wurde neu gestartet, da die URL '$URL' nicht erreichbar war."
    echo "$BODY" | mail -s "$SUBJECT" "$EMAIL"
}

# HTTP-Statuscode abrufen
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

# Überprüfen, ob HTTP-Statuscode ungleich 200 ist
if [ $HTTP_STATUS -ne 200 ]; then
    # Container neu starten
    docker restart "$CONTAINER_NAME"

    # E-Mail senden
    send_email
fi
