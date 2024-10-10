#!/bin/sh

# Исправленный скрипт для обнаружения процессорных ядер
sysctl -a | grep 'dev.cpu' | grep '.temperature' | awk -F '[ .]' '
BEGIN {
    print "{"
    print "  \"data\":["
}
{
    core = $3;  # Извлекаем индекс ядра (например, 0, 1, 2...)
    if (NR > 1) {
        printf ",\n"
    }
    printf "    {\"{#CPUID}\":\"%s\"}", core
}
END {
    print "\n  ]"
    print "}"
}'
