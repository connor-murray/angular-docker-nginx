### STAGE 1: Configure node environment ###
FROM node:8.6 as node

## Create ng-app & dist directories
RUN mkdir /ng-app
RUN mkdir /ng-app/dist

## Copy only the built application to the ng-app directory
COPY ./dist /ng-app/dist

### STAGE 2: Configure nginx ###
FROM nginx:1.13.3

## Replace nginx config with our own
COPY nginx/default.conf /etc/nginx/conf.d/

## Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

## Copy out built dist application to nginx directory as static files
COPY --from=node /ng-app/dist /usr/share/nginx/html

## Start nginx
CMD ["nginx", "-g", "daemon off;"]
