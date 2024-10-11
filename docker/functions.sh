#!/bin/bash

function is-service-running() {
  SERVICE=$1
  docker-compose ps --services --filter "status=running" | grep -w "$SERVICE" > /dev/null
  return $?
}

function rebuild-service-if-running() {
  SERVICE=$1
  if is-service-running $SERVICE; then
    docker-compose up --detach --build $SERVICE
  fi
}

function use-local-image() {
  SERVICE=$1
  BUILD_KEY=".services.${SERVICE}.build"
  IMAGE_KEY=".services.${SERVICE}.image"
  CONTEXT="../${SERVICE}"
  BUILD_VALUE="{\"context\": \"$CONTEXT\", \"dockerfile\": \"Dockerfile\"}"

  yq eval "$IMAGE_KEY = \"\"" -i docker-compose.yml
  yq eval "$BUILD_KEY = $BUILD_VALUE" -i docker-compose.yml
}

function use-remote-image() {
  SERVICE=$1
  BUILD_KEY=".services.${SERVICE}.build"
  IMAGE_KEY=".services.${SERVICE}.image"
  IMAGE_VALUE=$(yq eval ".services.${SERVICE}" images.yml)

  yq eval "del($BUILD_KEY)" -i docker-compose.yml
  yq eval -i "$IMAGE_KEY = \"$IMAGE_VALUE\" | $IMAGE_KEY style=\"\"" docker-compose.yml
}

function toggle-local-image() {
  SERVICE=$1
  BUILD_KEY=".services.${SERVICE}.build"
  BUILD_VALUE=$(yq eval "$BUILD_KEY" docker-compose.yml)

  if [ "$BUILD_VALUE" = "null" ]; then
    use-local-image $SERVICE
  else
    use-remote-image $SERVICE
  fi

  rebuild-service-if-running $SERVICE
}