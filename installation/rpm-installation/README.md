# RPM installation

## Preparation

### Add Storware repository

Refer to [Access to installation packages](../access-to-installation-packages.md) page for more information.

### Add MariaDB repository

Create new repository file: `touch /etc/yum.repos.d/MariaDB.repo`

Copy and paste this into a MariaDB.repo file:

```text
# MariaDB 10.3 CentOS repository list
# http://downloads.mariadb.org/mariadb/repositories/
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.3/centos7-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1
```

## Installation

### api-core component

1. Install api-core component

```text
# yum install api-core
```

### web-admin-ui component

1. Install web-admin-ui component

```text
# yum install web-admin-ui
```

### web-cloud-ui component

1. Install web-admin-ui component

```text
# yum install web-cloud-ui
```

{% hint style="info" %}
web-cloud-ui component install only html source files, you will need web server, we recommend to use [nginx](../using-nginx-as-a-reverse-proxy-and-web-server.md#nginx-as-a-web-server)
{% endhint %}

### kodo-agent component

{% hint style="info" %}
Install kodo-agent component if you want to protect Office365 or Box service
{% endhint %}

1. Install kodo-agent component

```text
# yum install kodo-agent
```

## Nginx

See [Using nginx as a reverse proxy and web server](../using-nginx-as-a-reverse-proxy-and-web-server.md#installation)

