Just test for syncyng rails app between a docker container and host file system.

- docker-compose run --rm web bundle install
- docker-compose run --rm web rake -T
