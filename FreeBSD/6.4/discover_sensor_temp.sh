#!/bin/sh

# Скрипт для обнаружения датчиков температуры ACPI
sysctl -a | grep 'hw.acpi.thermal.tz' | grep '.temperature' | sed -E 's/hw.acpi.thermal.tz([0-9]+)\.temperature: .*/\1/' | awk '
BEGIN {
    print "{"
    print "  \"data\":["
}
{
    if (NR > 1) {
        printf ",\n"
    }
    printf "    {\"{#UID}\":\"%s\"}", $1
}
END {
    print "\n  ]"
    print "}"
}'
