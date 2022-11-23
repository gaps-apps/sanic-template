.PHONY: all run tests 

run: stop
	docker-compose up sanic_template --build -d

stop:
	docker-compose kill sanic_template

tests: stop run
	docker-compose exec -ti sanic_template bash -c "cd /opt; pipenv run pytest -vv tests/"

black:
	black .

mypy:
	mypy --follow-imports skip --ignore-missing-imports --warn-unreachable --pretty --tb .

make logs:
	docker-compose logs sanic_template
