postgres:
	docker run --name=learn-mail -p 5435:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=root -d postgres:15-alpine

createdb:
	docker exec -it learn-mail createdb --username=root --owner=root mail_box

dropdb:
	docker exec -it learn-mail dropdb mail_box

migrateup:
	migrate -path internal/db/migration -database "postgres://root:root@127.0.0.1:5435/mail_box?sslmode=disable" -verbose up

migratedown:
	migrate -path internal/db/migration -database "postgres://root:root@127.0.0.1:5435/mail_box?sslmode=disable" -verbose down

.PHONY: postgres createdb dropdb