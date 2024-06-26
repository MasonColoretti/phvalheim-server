#!/bin/bash
source /opt/stateless/engine/includes/phvalheim-static.conf
#source /opt/stateful/config/phvalheim-backend.conf

if [ ! -d "$worldsDirectoryRoot" ]; then
        echo "`date` [NOTICE : phvalheim] Worlds directory Root missing, creating..."
        mkdir -p $worldsDirectoryRoot
fi

if [ ! -d "$tsModsDir" ]; then
        echo "`date` [NOTICE : phvalheim] Thunderstore mods download directory missing, creating..."
        mkdir -p $tsModsDir
fi

if [ ! -d "$tsWIP" ]; then
	#echo " Thunderstore WIP directory missing, creating...", this will always display, tsWIP runs on stateless storage
	mkdir -p $tsWIP
fi

if [ ! -d "$backupDir" ]; then
	echo "`date` [NOTICE : phvalheim] Backup directory missing, creating..".
        mkdir -p $backupDir
fi

if [ ! -d "$worldSupervisorConfigs" ]; then
        echo "`date` [NOTICE : phvalheim] World supervisor config directory missing, creating..."
        mkdir -p $worldSupervisorConfigs
fi



# prep perms
useradd phvalheim > /dev/null 2>&1
chown phvalheim: /opt/stateful
chown -R phvalheim: /opt/stateful/games
chown -R phvalheim: /opt/stateful/logs
chown -R mysql:mysql /opt/stateful/mysql
chown -R phvalheim: /tmp/dumps
chown -R phvalheim: $tsWIP
chown -R phvalheim: $backupDir
