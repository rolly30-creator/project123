#!/bin/bash

# Name of the service
SERVICE="httpd"

# Check if the service is active
if systemctl is-active --quiet "$SERVICE"; then
    echo "$(date): $SERVICE is running."
else
    echo "$(date): $SERVICE is not running. Attempting to start it..."
    sudo systemctl start "$SERVICE"

    # Check again if it started successfully
    if systemctl is-active --quiet "$SERVICE"; then
        echo "$(date): Successfully started $SERVICE."
    else
        echo "$(date): Failed to start $SERVICE."
    fi
fi
