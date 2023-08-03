postgres:
	docker run --name=learn-mail -p 5435:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=root -d postgres:15-alpine

.PHONY: postgres