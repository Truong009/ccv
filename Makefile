.PHONY: start
start:
		docker compose --profile "combined-cpu" up --build

.PHONY: download
download:
		docker compose --profile download up --build

.PHONY: clean
clean:
		docker system prune -a --volumes --force
