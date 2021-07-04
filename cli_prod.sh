#!/usr/bin/env bash
#Composer
composer(){
	docker-compose -f docker-compose.prod.yml run --rm php composer $@
}

#docker-compose up
up(){
	docker-compose -f docker-compose.prod.yml up $@
}

#docker-compose down
down(){
	docker-compose -f docker-compose.prod.yml down
}

#Symfony cli
console(){
	docker-compose -f docker-compose.prod.yml run --rm php bin/console $@
}

#tests
run_tests(){
	docker-compose -f docker-compose.prod.yml run --rm php bin/phpunit $@
}

print_logs(){
	docker-compose -f docker-compose.prod.yml logs
}

yarn(){
    docker run -it --rm -v `pwd`/symfony:/app -w /app rudiwork/yarn yarn $@
}

wpp(){
   docker run -it --rm -v `pwd`/symfony:/app -w /app rudiwork/yarn yarn encore prod $@
}

cc() {
  docker-compose -f docker-compose.prod.yml run --rm php bin/console cache:clear
}
cw() {
  docker-compose -f docker-compose.prod.yml run --rm php bin/console cache:warmup
}
