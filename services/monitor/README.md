## Included projects

- https://github.com/amir20/dozzle
- https://github.com/crazy-max/diun
- https://github.com/AnalogJ/scrutiny
- https://github.com/alexjustesen/speedtest-tracker
- https://github.com/louislam/uptime-kuma

## Dependencies

- Hard dependency on the **infra** service stack, which provides the Docker Socket Proxy
- You may which to provide some apps externally, especially Uptime Kuma. Public access via Reverse Proxy requires the **public** Service and Network

## Environment and Configuration

### Files
1. Copy `./configtemplates/scrutiny/scrutiny.yaml` to your config directory for Scrutiny `${CONFIGDIR}/scrutiny/scrutiny.yaml`

### Ports

- `PORT_SOCKY_PROXY` - defined as part of **infra**
- `PORT_DOZZLE`
- `PORT_SPEEDTEST`
- `PORT_UPKUMA`
- `PORT_SCRUTINY`
- `PORT_SCRUTINY_DB`

### URLs
- `SERVER_URL` - universal. your internal url
- `DOMAIN` - universal. your public facing domain name

### Functionality
- `HOST_NAME` - Universal. Helps orient you within Dozzle

- `DIUN_NOTIF_DISCORD_WEBHOOKURL` - Refer to Diun's instructions. I use Discord
- `./staticconfig/diun/diun.yml` - Refer to Diun's instructions. You may need to edit this file for your needs.

- `SPEEDTEST_APP_KEY` - I don't really understand why this is needed, but it is. Once the container is running, execute this command and paste the result into your .env: `php artisan key:generate --show`

- `${CONFIGDIR}/scrutiny/scrutiny.yaml` - Refer to Scrutiny's instructions.


### Data and Backups
- `CONFIGDIR` - universal. where the containers store their configuration data (aka Volume)
- `DBDIR` - universal. where databases store their... databases. 
- Each harddisk should be shared to Scrutiny via `devices` (eg. /dev/sda)


## Backups
- If needed, standard backup of CONFIGDIR