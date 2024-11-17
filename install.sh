#!/bin/sh

readonly SERVER_STATS_URL="https://raw.githubusercontent.com/faridlamaul/server-performance-stats/main/server-stats.sh"
readonly SERVER_STATS_DIRECTORY="/usr/local/bin"

if [ ${EUID} -ne 0 ]; then
    echo "This script must be run as root. Cancelling" >&2
    exit 1
fi

if [ -f "${SERVER_STATS_DIRECTORY}/server-stats" ]; then
    echo "Server stats tool is already installed."
    exit 0
fi

echo "Installing server stats tool..."

curl -sL "${SERVER_STATS_URL}" -o "${SERVER_STATS_DIRECTORY}/server-stats"
chmod +x "${SERVER_STATS_DIRECTORY}/server-stats"

echo "server stats tool has been installed to ${SERVER_STATS_DIRECTORY}/server-stats" 