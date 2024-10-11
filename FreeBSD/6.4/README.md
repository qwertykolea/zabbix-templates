Monitoring temperature on FreeBSD with Zabbix agent 6.4

Based on official template: https://www.zabbix.com/ru/integrations/freebsd

1. Adding temperature monitoring:
   * Intel CPU: kldload coretemp
   * AMD CPU: kldload amdtemp.ko
Add to "/boot/loader.conf" string: coretemp_load=»YES»
2. Put "discover_cpu_temp.sh" to "/usr/local/bin/discover_cpu_temp.sh"
3. Put "discover_sensor_temp.sh" to "/usr/local/bin/discover_sensor_temp.sh"
4. chmod +x /usr/local/bin/discover_cpu_temp.sh
5. chmod +x /usr/local/bin/discover_sensor_temp.sh
6. Add to Zabbix agent Advanced Features section:

UserParameter=cpu.discovery,/usr/local/bin/discover_cpu_temp.sh

UserParameter=cpu.temperature[*],sysctl -n dev.cpu.$1.temperature

UserParameter=sensor.discovery,/usr/local/bin/discover_sensor_temp.sh

UserParameter=sensor.temperature[*],sysctl -n hw.acpi.thermal.tz$1.temperature

7. Restart Zabbix agent service

   


coretemp_load="YES"
