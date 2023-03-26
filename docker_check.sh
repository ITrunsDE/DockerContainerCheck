#!/bin/bash

# URL to check
URL="http://software-db.test"

# Docker-Container-Name
CONTAINER_NAME="my-container"

# E-Mail-Recipient
EMAIL="my_mail@example.com"

# Function to send the mail
send_email() {
    SUBJECT="Docker-Container rebooted"
    BODY="The Docker-Container '$CONTAINER_NAME' was rebooted, because the URL '$URL' did not respond."
    echo "$BODY" | mail -s "$SUBJECT" "$EMAIL"
}

# get HTTP status code
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

# Check if HTTP status code is not 200
if [ $HTTP_STATUS -ne 200 ]; then
    # Container restart
    docker restart "$CONTAINER_NAME"

    # send E-Mail
    send_email
fi
