# Cloud-native Production Node Express TypeScript Setup with Docker
This Repo contains Production Ready  Boilerplate of Express TypeScript Application with Docker Setup.

## Running application in docker environment using docker-compose

Use docker-compose to setup the whole solution in local docker environment. Use the `.env` file to update the necessary ports and configurations required.

- `docker-compose.yml` - Docker compose file 
- `Dockerfile` - The main Dockerfile for running application in a hosted environment
- `.env` - The configurations for docker-compose 

```s
# To Run Docker Build
docker-compose up

# Run without using cached layers
docker-compose up --build
```

This will open the application in the port number provided in the `.env` file as `PORT`.

Open `http://localhost:$PORT/`

## Docker Image Lifecycle

Connect to the Docker registry and use the following commands to push images to the registry. 

Build and push image

```
docker build -t neuappmode/nodejs:12-alpine-linux .
docker push neuappmode/nodejs:12-alpine-linux
```

Running docker container
```
docker run --init -p 3005:3005 -e PORT="3005" -e NODE_ENV="production" neuappmode/nodejs:12-alpine-linux
```

Open `http://localhost:3000/`



## Helm Chart for Kubernetes Deployment

The helm charts for the deployment can be found in the `/charts` folder. The folder consist of all the helm charts used for the initiative. 