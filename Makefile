.PHONY: up down start stop restart logs shell build pull clean prune-volumes prune-networks prune-all

# Start services in detached mode
up:
	docker compose up -d

# Stop and remove containers
down:
	docker compose down

# Start existing containers
start:
	docker compose start

# Stop running containers
stop:
	docker compose stop

# Restart services
restart:
	docker compose restart

# View logs (follow mode)
logs:
	docker compose logs -f

# View logs for n8n only
logs-n8n:
	docker compose logs -f n8n

# Open shell in n8n container
shell:
	docker compose exec n8n /bin/sh

# Build/rebuild services
build:
	docker compose build

# Pull latest images
pull:
	docker compose pull

# Stop and remove containers, networks, and volumes
clean:
	docker compose down -v

# Show running containers
ps:
	docker compose ps

# Remove volumes created by docker compose
prune-volumes:
	-docker compose down -v --remove-orphans

# Remove networks created by docker compose
prune-networks:
	-docker compose down --remove-orphans
	-docker network prune -f

# Remove all resources (containers, volumes, networks, images)
prune-all:
	-docker compose down -v --rmi all --remove-orphans
	-docker network prune -f
