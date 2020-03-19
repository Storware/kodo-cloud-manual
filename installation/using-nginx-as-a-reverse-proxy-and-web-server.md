# Using nginx as a reverse proxy and web server

## Nginx as a reverse proxy

> A **reverse proxy** is a type of [proxy server](https://en.wikipedia.org/wiki/Proxy_server) that retrieves resources on behalf of a [client](https://en.wikipedia.org/wiki/Client_%28computing%29) from one or more [servers](https://en.wikipedia.org/wiki/Server_%28computing%29). These resources are then returned to the client, appearing as if they originated from the proxy server itself. - [https://en.wikipedia.org/wiki/Reverse\_proxy](https://en.wikipedia.org/wiki/Reverse_proxy)

KODO system consists of services that cooperate together, using reverse proxy is required for system to function properly.

It's address is the one advertised for the KODO system, and it sits at the edge of the site’s network to accept requests and pass them to correct services

## Nginx as a web server

We are also using Nginx to serve web admin UI. Web UI is delivered as a html files.

## Installation

Install CentOS EPEL repository

```text
yum -y install epel-release
```

Install nginx from repository:

```text
yum -y install nginx
```

## Configuration

To configure Nginx as a reverse proxy to an HTTP server you need to specify a location and an address of proxied server inside.

### location /

Main location should point to web admin UI path:

```text
location / {
    root /usr/share/nginx/html;
    index index.html index.htm;
    try_files $uri $uri/ /index.html =404;
  }
```

{% hint style="info" %}
You can install web admin UI on other host
{% endhint %}

### location /api

Location /api needs to point to api-core service:

```text
location /api {
    proxy_set_header  X-Real-IP $remote_addr;
    proxy_set_header  X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header  Host $http_host;
    proxy_set_header X-Forwarded-Proto https;
    proxy_redirect off;
    proxy_connect_timeout      300;
    proxy_send_timeout         300;
    proxy_read_timeout         300;
    proxy_buffering off;
    proxy_request_buffering off;
    proxy_pass https://localhost:8181;
}
```

### Exmaple nginx.conf file

You can use example file and adjust in to your needs:

{% file src="../.gitbook/assets/nginx\_exmaple.conf" caption="Download nginx example configuration" %}

### Starting nginx instance

To start nginx instance execute following command:  
`systemctl start nginx`

### Stopping nginx instance

To stop KODO Server instance execute following command:  
`systemctl stop nginx`

### Automatically starting nginx

Enable nginx service:  
`systemctl enable nginx.service`

