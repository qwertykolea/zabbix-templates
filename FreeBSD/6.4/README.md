1. Put "discover_cpu_temp.sh" to "/usr/local/bin/discover_cpu_temp.sh"
2. Put "discover_sensor_temp.sh" to "/usr/local/bin/discover_sensor_temp.sh"
3. chmod +x /usr/local/bin/discover_cpu_temp.sh
4. chmod +x /usr/local/bin/discover_sensor_temp.sh
5. Add to Zabbix agent Advanced Features section:

   
UserParameter=cpu.discovery,/usr/local/bin/discover_cpu_temp.sh

UserParameter=cpu.temperature[*],sysctl -n dev.cpu.$1.temperature

UserParameter=sensor.discovery,/usr/local/bin/discover_sensor_temp.sh

UserParameter=sensor.temperature[*],sysctl -n hw.acpi.thermal.tz$1.temperature

