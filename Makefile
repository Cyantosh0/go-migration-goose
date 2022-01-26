include .env

MIGRATE=goose -dir=migrations -allow-missing mysql "${DB_USER}:${DB_PASSWORD}@/${DB_NAME}?parseTime=true"

migrate-status:
	$(MIGRATE) status

migrate-up:
	$(MIGRATE) up

migrate-down:
	$(MIGRATE) down 

redo:
	@read -p  "Are you sure to reapply the last migration? [y/n]" -n 1 -r; \
	if [[ $$REPLY =~ ^[Yy] ]]; \
	then \
		$(MIGRATE) redo; \
	fi

create:
	@read -p  "What is the name of migration?" NAME; \
	${MIGRATE} create $$NAME sql

.PHONY: migrate-status migrate-up migrate-down redo create