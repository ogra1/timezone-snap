#! /bin/sh

set -e

TZ="$(wget -q -O- https://geoip.ubuntu.com/lookup|sed 's/^.*<TimeZone>//;s/<\/.*$//')"

[ -n "$TZ" ] || exit 0

while ! timedatectl set-timezone "$TZ"; do
    echo "timezone control interface not connected yet, please run:"
    echo "snap connect $SNAP_NAME:timezone-control"
    echo "sleeping for 10 sec"
    sleep 10
done
