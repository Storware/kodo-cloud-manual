# Installation using Ansible playbook

You can install complete Kodo for Cloud solution using the following 2 roles, available on Ansible Galaxy:

* Kodo Cloud Server: [https://galaxy.ansible.com/xe0nic/ansible\_kodo\_cloud\_server](https://galaxy.ansible.com/xe0nic/ansible_kodo_cloud_server)
* Kodo Cloud Agent: [https://galaxy.ansible.com/xe0nic/ansible\_kodo\_cloud\_agent](https://galaxy.ansible.com/xe0nic/ansible_kodo_cloud_agent)

## Prerequisites

You need to prepare CentOS/RHEL 8 minimal for Kodo for Cloud \(both roles can be installed on the same or different hosts\).

This example assumes that you have `root` access to this host and you have configured your Ansible to connect with SSH public-keys to your host. For example:

generate key:  
`ssh-keygen -f ~/.ssh/id_rsa -P ""`

and copy it to your CentOS/RHEL box:  
`ssh-copy-id -i ~/.ssh/id_rsa.pub root@YOUR_HOST`

Agents will communicate with Kodo Cloud Server on port 8181, so they need to be able to access it using the servers FQDN \(needs to be resolvable\).

## Installation

This example assumes that you want to install both Kodo for Cloud server and agent **using a single playbook** and **on the same host** \(single agent\) ****and currently this is the only supported deployment.

Run these on the system from which you run Ansible playbooks:

* Install Ansible roles:

  `ansible-galaxy install xe0nic.ansible_kodo_cloud_server  
  ansible-galaxy install xe0nic.ansible_kodo_cloud_agent`

* Create playbook directory and change it working directory, i.e: `mkdir kodo && cd kodo`
* Create inventory file - i.e. `hosts`:

{% code title="hosts" %}
```text
[all:vars]
ansible_user = root

[server]
192.168.155.233

[agents]
192.168.155.233 agent_name=voyager
```
{% endcode %}

* Create playbook file - `site.yml`:

{% code title="site.yml" %}
```yaml
---

- hosts: server
  roles:
   - xe0nic.ansible_kodo_cloud_server

- hosts: agents
  roles:
   - xe0nic.ansible_kodo_cloud_agent
```
{% endcode %}

* Run playbook: `ansible-playbook -i hosts site.yml`
* After installation you should be able to login to your Kodo Cloud Server: `https://kodo_cloud_server_address` and your nodes should be registered and running. 
* By default Kodo Cloud has one global admin \(admin managing organizations\) account and a account in the default organization:
  * Kodo admin \(global admin\): `kodoadmin` with password `Kodo@dm1n` \(with zero\)
  * default organization admin: `admin` with password `Kodo@dm1n` \(with zero\)

## Variables

These two roles use just a few variables. Both plays use `server_fqdn` variable. If not defined, server play sets variable `server_fqdn` to the hostname reported by the OS on which it is installed. Server play will generate SSL certificate for this FQDN, and node play automatically will use this value if defined. You can also provide this variable manually \(either in `hosts` file or with extra vars switch in `ansible-playbook` command, i.e. `-e "server_fqdn=kodo.server.local"`

Node play needs `agent_name` for registration process. If not provided it will just use hostname reported by OS, however keep in mind that it needs to be **unique** for each node. We recommend that you set them in the host inventory file.

By default Kodo for Cloud uses MariaDB 10.4 for CentOS - you can control source, distribution and version of your MariaDB with the following variables \(with their respective default values\):

```yaml
mariadb_version: "10.4"
mariadb_distro: "centos7-amd64"
mariadb_repo_url: "http://yum.mariadb.org/{{ mariadb_version }}/{{ mariadb_distro }}"
mariadb_repo_gpg_key: "https://yum.mariadb.org/RPM-GPG-KEY-MariaDB"
```

Installer assumes **staging** space to be mounted in `/kodo_data/staging` and **backup destination** mounted in `/kodo_data/backup` - we recommend to leave these defaults and just mount appropriate storage underneath `/kodo_data`

Ansible playbook is also able to automatically prepare **deduplication** \(by default storage used for staging and backup destination it is not initialized and just assumed to be present under above-mentioned paths\). To enable deduplication - you just need to provide a block device which will be used for VDO \(by default it is empty string, which means that VDO is not going to be initialized\). VDO will be mounted in `/kodo_data` by default which means that both staging space and backup destination will use the same storage.

```yaml
vdo_physical_device: "/dev/sdb"
```

