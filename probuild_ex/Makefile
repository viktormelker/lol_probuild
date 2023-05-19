create-db:
	docker run -e POSTGRES_PASSWORD=resurrect -e POSTGRES_DB=probuild_ex_dev -d postgres -p 5432:5432 postgres:latest --name probuild

start-db:
	docker start probuild
