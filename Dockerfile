FROM nginx:1.13.3-alpine

## Replace nginx config with our own
COPY nginx/default.conf /etc/nginx/conf.d/

## Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

## Copy our built dist app to nginx dir to serve static files
COPY ./dist /usr/share/nginx/html

## Start nginx
CMD ["nginx", "-g", "daemon off;"]
