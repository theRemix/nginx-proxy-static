# Sample nginx backend + static app routing

a simple node server at `/app/server/index.js` will be listening on port 8080, proxied via nginx at any path in `/api/*`

a simple static "app" will be served from `/app/static/index.html` when any other route _(not in /api/*)_ is requested

nginx is listening on port 80, the docker image exposes this port

## Test server

```
docker run -d --name nginx-proxy-static -p 8080:80 theremix/nginx-proxy-static
```

in a browser, assuming your docker host is at localhost

_static routes, all non /api/ routes direct to here_

http://localhost:8080/

http://localhost:8080/hello

_api routes, with reverse proxy to backend_

http://localhost:8080/api/

http://localhost:8080/api/world
