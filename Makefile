.PHONY: start-cpu
start-cpu:
		docker compose --profile "combined-cpu" up -d

.PHONY: dev-cpu
dev-cpu:
		docker compose --profile "combined-cpu" up --build

.PHONY: start
start:
		docker compose --profile "combined" up -d

.PHONY: dev
dev:
		docker compose --profile "combined" up --build

.PHONY: download
download:
		docker compose --profile download up --build

.PHONY: clean
clean:
		docker system prune -a --volumes --force
