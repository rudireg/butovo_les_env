#!/usr/bin/env bash
#Composer
composer(){
	docker-compose -f docker-compose.dev.yml run -e XDEBUG_MODE=off --rm butovo_les composer $@
}

#docker-compose up
up(){
	docker-compose -f docker-compose.dev.yml up $@
}

#docker-compose down
down(){
	docker-compose -f docker-compose.dev.yml down
}

#Symfony cli
console(){
	docker-compose -f docker-compose.dev.yml run -e XDEBUG_MODE=off --rm butovo_les bin/console $@
}

#tests
run_tests(){
	docker-compose -f docker-compose.dev.yml run --rm php bin/phpunit $@
}

print_logs(){
	docker-compose -f docker-compose.dev.yml logs
}

yarn(){
    docker run -it --rm -v `pwd`/symfony:/app -w /app rudiwork/yarn yarn $@
}

wpp(){
   docker run -it --rm -v `pwd`/symfony:/app -w /app rudiwork/yarn yarn encore prod $@
}

wpd(){
   docker run -it --rm -v `pwd`/symfony:/app -w /app rudiwork/yarn yarn encore dev $@
}

cc() {
  docker-compose -f docker-compose.dev.yml run -e XDEBUG_MODE=off --rm butovo_les bin/console cache:clear
}
cw() {
  docker-compose -f docker-compose.dev.yml run --rm butovo_les bin/console cache:warmup
}
