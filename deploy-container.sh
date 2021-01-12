#!/bin/bash
IMAGE_NAME="bdotransact/api-gateway"
docker-compose down
chmod +x ./mvnw
./mvnw spring-boot:build-image -Dspring-boot.build-image.imageName=$IMAGE_NAME
docker-compose up -d
