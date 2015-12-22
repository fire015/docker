project_name=app

up:
	$(MAKE) compose

stop:
	docker-compose -p ${project_name} stop

clean:
	@echo "Cleaning up"
	$(MAKE) stop
	docker-compose -p ${project_name} rm -f

pull:
	docker-compose -p ${project_name} pull

logs:
	docker-compose -p ${project_name} logs

compose:
	docker-compose -p ${project_name} up -d

.PHONY: config clean compose build tag push pull stop