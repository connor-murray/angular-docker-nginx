# Angular Docker Nginx

A built dist Angular application served within a Docker container using NGINX.

## Prerequisites
- Install Docker

## Running Application
- Install dependencies: `yarn`
- Serve application within docker: `yarn run docker:all`. This will do the following:
  * Build production application: `ng build --prod` 
  * Remove previous Docker container if exists: `docker:remove` 
  * Generate Docker image: `docker:build` 
  * Run up docker image within container serving Angular application on port 8085: `docker:start` 

## Notes
- Application is built and only contents of dist folder are copied into docker. Therefore container does not contain un-minified code.