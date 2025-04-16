# ![veld code](https://raw.githubusercontent.com/veldhub/.github/refs/heads/main/images/symbol_V_letter.png) veld_code__postgres

This repo contains a [code veld](https://zenodo.org/records/13322913) encapsulating a postgres
instance.

## requirements

- git
- docker compose (note: older docker compose versions require running `docker-compose` instead of 
  `docker compose`)

## how to use

A code veld may be integrated into a chain veld, or used directly by adapting the configuration 
within its yaml file and using the template folders provided in this repo. Open the respective veld 
yaml file for more information.

**[./veld.yaml](./veld.yaml)** 

Starts a postgres instance. The configuration file can be adjusted at
[./data/input/postgresql.conf](./data/input/postgresql.conf), and the postgres database is stored at
[./data/storage/](./data/storage/).

```
docker compose -f veld.yaml up
```

