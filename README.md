# docker-airflow-lightweight

Lightweight docker compose template for Apache Airflow

This repo is used for storing dags, to use: update dags folder and push it and CI will run for you.

## getting started

1. Clone this repo

```bash
git clone https://github.com/thangbuiq/docker-airflow-lightweight
cd docker-airflow-lightweight
```

2. Make sure you have `docker` and `docker-compose` installed

> Follow my guide to install docker and docker-compose: [here](https://thangbuiq.work/docs/linux-and-ubuntu-setup/docker/)

3. Optional: Create a `.env` file in the root directory with the fields in `.env.example`
4. Optional: Update the `dags` folder with your own dags
5. Optional: Update the `requirements.txt` file with your own dependencies
6. Run the whole airflow stack using:

```bash
docker compose up -d
# or
make up
```

> if you missed the `.env` setup, the default values will be used, which are not secure
> login: `airflow`, password: `airflow`

7. Access the Airflow webserver at `http://localhost:8080`

## update connections

Run this command to update connections: 

```bash
make update-connections
```

This will add/modify/remove the connections by tracking the `connections.json` file.

```json
{
  "your-conn-id-1": {
    "conn_type": "ssh",
    "description": "optional",
    "login": "required",
    "password": "required",
    "host": "xxx.xxx.xxx.xxx",
    "port": 22,
    "schema": "optional",
    "extra": "optional"
  },
}
```

Note that you should clear all connections in Admin -> Connections before run `make update-connections`.