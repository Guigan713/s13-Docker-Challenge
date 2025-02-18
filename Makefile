ENV_FILE=.env

.PHONY: dev prod

include ./sonarqube/.env

watch:
	@echo "ENVIRONMENT=development" > $(ENV_FILE)
	@docker-compose up --build --watch

run:
	@echo "ENVIRONMENT=production" > $(ENV_FILE)
	@docker-compose up --build


sonar-scan:
	docker run \
		--rm \
		--network="host" \
		-e SONAR_HOST_URL="http://localhost.9000" \
		-e SONAR_TOKEN="${SONAR_TOKEN}" \
		-v "./sonarqube:/usr/src" \
		sonarsource/sonar-scanner-cli \ 
		-Dsonar.projectKey=${PROJECT_KEY}