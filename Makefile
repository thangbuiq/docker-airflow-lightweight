update-connections:
	docker cp connections.json airflow-scheduler:/opt/airflow/connections.json
	docker exec -it airflow-scheduler airflow connections import /opt/airflow/connections.json

up:
	@export AIRFLOW_UID=$$(id -u) && export AIRFLOW_GID=$$(id -g) && docker compose up -d
