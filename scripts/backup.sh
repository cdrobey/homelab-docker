varDate=$(date +%Y%m%d)
varBackupDir=/home/user/backup
varConfigDir=/srv/docker

cd $varBackupDir
mkdir $varDate && cd $varDate

# Database backups
sudo docker exec -t tandoor_db pg_dumpall -U tandoor_user > tandoor_pgdump.sql



# Docker config backups
mkdir -p $varBackupDir/$varDate/ghs && cp -rpi $varConfigDir/ghs $varBackupDir/$varDate/ghs

mkdir -p $varBackupDir/$varDate/homepage && cp -rpi $varConfigDir/homepage/*.yaml $varBackupDir/$varDate/homepage

mkdir -p $varBackupDir/$varDate/jellyfin
cp -rpi $varConfigDir/jellyfin/config $varBackupDir/$varDate/jellyfin
cp -rpi $varConfigDir/jellyfin/data $varBackupDir/$varDate/jellyfin
cp -rpi $varConfigDir/jellyfin/root $varBackupDir/$varDate/jellyfin

mkdir -p $varBackupDir/$varDate/jellyseerr
cp -rpi $varConfigDir/jellyseerr/db $varBackupDir/$varDate/jellyseerr
cp -rpi $varConfigDir/jellyseerr/settings.json $varBackupDir/$varDate/jellyseerr

mkdir -p $varBackupDir/$varDate/prowlarr
varTempProwlarrBackup=$(ls -Art $varConfigDir/prowlarr/Backups/scheduled | tail -n 1)
cp -rpi $varConfigDir/prowlarr/Backups/scheduled/$varTempProwlarrBackup $varBackupDir/$varDate/prowlarr

mkdir -p $varBackupDir/$varDate/radarr3
varTempRadarrBackup=$(ls -Art $varConfigDir/radarr3/Backups/scheduled | tail -n 1)
cp -rpi $varConfigDir/radarr3/Backups/scheduled/$varTempRadarrBackup $varBackupDir/$varDate/radarr3

mkdir -p $varBackupDir/$varDate/sonarr
varTempSonarrBackup=$(ls -Art $varConfigDir/sonarr/Backups/scheduled | tail -n 1)
cp -rpi $varConfigDir/sonarr/Backups/scheduled/$varTempSonarrBackup $varBackupDir/$varDate/sonarr

mkdir -p $varBackupDir/$varDate/qbittorrent
cp -rpi $varConfigDir/qbt/qBittorrent/qBittorrent.conf $varBackupDir/$varDate/qbittorrent

mkdir -p $varBackupDir/$varDate/ripping
cp -rpi $varConfigDir/ripping $varBackupDir/$varDate/ripping

mkdir -p $varBackupDir/$varDate/scrutiny
cp -rpi $varConfigDir/scrutiny $varBackupDir/$varDate/scrutiny

mkdir -p $varBackupDir/$varDate/uptime-kuma
cp -rpi $varConfigDir/uptime-kuma/kuma.db $varBackupDir/$varDate/uptime-kuma
cp -rpi $varConfigDir/uptime-kuma/kuma.db-wal $varBackupDir/$varDate/uptime-kuma
cp -rpi $varConfigDir/uptime-kuma/kuma.db-shm $varBackupDir/$varDate/uptime-kuma

mkdir -p $varBackupDir/$varDate/wireguard
cp -rpi $varConfigDir/wireguard/wg0.conf $varBackupDir/$varDate/wireguard