# Installation using the Ansible playbook

Before starting the installation process you need to prepare your server platform accordingly to the size of the Microsoft 365 organization you are going to protect \(see the chapter [Sizing](https://storware.gitbook.io/kodo-for-cloud-office365/planning/sizing)\).

You can install a complete Kodo for Cloud solution using the following 2 roles, available on the Ansible Galaxy:

* Kodo Cloud Server: [https://galaxy.ansible.com/xe0nic/ansible\_kodo\_cloud\_server](https://galaxy.ansible.com/xe0nic/ansible_kodo_cloud_server)​
* Kodo Cloud Agent: [https://galaxy.ansible.com/xe0nic/ansible\_kodo\_cloud\_agent](https://galaxy.ansible.com/xe0nic/ansible_kodo_cloud_agent)​

## Prerequisites <a id="prerequisites"></a>

You need to prepare CentOS/RHEL 8 server minimal for Kodo for Cloud \(both roles can be installed on the same or different hosts\).

This example assumes that you have `root` access to this host and you have configured your Ansible to connect with SSH public-keys to your host. For example:

generate a key:

```text
# ssh-keygen -f ~/.ssh/id_rsa -P ""
```

and copy it to your CentOS/RHEL box:

```text
# sopy-id -i ~/.ssh/id_rsa.pub root@YOUR_HOST
```

 Agents communicate with Kodo Cloud Server on port 8181, so they need to be able to access it using the server FQDN \(it needs to be resolvable\).

## Installation <a id="installation"></a>

This example assumes that you want to install both Kodo for Cloud server and agent **using a single playbook** and **on the same host** \(single agent\) and currently this is the only supported deployment.

Run these on the system from which you run Ansible playbooks:

* Install Ansible roles:

  `ansible-galaxy install xe0nic.ansible_kodo_cloud_server ansible-galaxy install xe0nic.ansible_kodo_cloud_agent`

* Create a playbook directory and change its working directory, i.e: `mkdir kodo && cd kodo`
* Create an inventory file - i.e. `hosts`:

```text
hosts[all:vars]ansible_user = root​[server]192.168.155.233​[agents]192.168.155.233 agent_name=voyager
```

* Create a playbook file - `site.yml`:

```text
site.yml---​- hosts: server  roles:   - xe0nic.ansible_kodo_cloud_server​- hosts: agents  roles:   - xe0nic.ansible_kodo_cloud_agent
```

* Run playbook: `ansible-playbook -i hosts site.yml`
* After installation you should be able to log into your Kodo for Cloud server: `https://kodo_cloud_server_address:8181` and your nodes should be registered and running.

KODO for Cloud server credentials are described in the chapter [Administration access levels](https://storware.gitbook.io/kodo-for-cloud-office365/deployment/first-steps-after-deployment/administration-access-levels)​

## Variables <a id="variables"></a>

These two roles use just a few variables. Both plays use `server_fqdn` variable. If not defined, server play sets variable `server_fqdn` to the hostname reported by the OS on which it is installed. Server play will generate SSL certificate for this FQDN, and node play automatically will use this value if defined. You can also provide this variable manually \(either in `hosts` file or with extra vars switch in `ansible-playbook` command, i.e. `-e "server_fqdn=kodo.server.local"`

Node play needs `agent_name` for the registration process. If not provided it will just use the hostname reported by OS, however, keep in mind that it needs to be **unique** for each node. We recommend that you set them in the host inventory file.

By default KODO for Cloud uses MariaDB 10.4 for CentOS - you can control the source, distribution, and version of your MariaDB with the following variables \(with their respective default values\):

```text
mariadb_version: "10.4"mariadb_distro: "centos8-amd64"mariadb_repo_url: "http://yum.mariadb.org/{{ mariadb_version }}/{{ mariadb_distro }}"mariadb_repo_gpg_key: "https://yum.mariadb.org/RPM-GPG-KEY-MariaDB"
```

The installer assumes **staging** space to be mounted in `/kodo_data/staging` and **backup destination** mounted in `/kodo_data/backup` - we recommend to leave these defaults and just mount appropriate storage underneath `/kodo_data`

Ansible playbook is also able to automatically prepare **deduplication** \(by default storage used for staging and backup destination it is not initialized and just assumed to be present under the above-mentioned paths\). To enable deduplication - you just need to provide a block device that will be used for VDO \(by default it is an empty string, which means that VDO is not going to be initialized\). VDO will be mounted in `/kodo_data` by default which means that both staging space and backup destination will use the same storage.

```text
vdo_physical_device: "/dev/sdb"
```

Now you should be able to log into the web console using the URL: `https://KODO_SERVER_HOST:8181`, where `KODO_SERVER_HOST` is the hostname or IP address of your Kodo for Cloud server.

KODO for Cloud server credentials are described in the chapter [Administration access levels](https://storware.gitbook.io/kodo-for-cloud-office365/deployment/first-steps-after-deployment/administration-access-levels)​

Go to the [First steps after the deployment](https://storware.gitbook.io/kodo-for-cloud-office365/deployment/first-steps-after-deployment) chapter to configure KODO for Cloud server or go to the [Installation with the RPMs](https://storware.gitbook.io/kodo-for-cloud-office365/deployment/installation-with-rpms) chapter if you want to install KODO for Cloud server using the RPM packages.

