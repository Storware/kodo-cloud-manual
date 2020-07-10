# Installation with RPMs

## Prerequisites

1. Install CentOS/RHEL 8 minimal
   * if you plan to use deduplication with VDO we recommend to install RHEL to have Red Hat's support available
2. Make sure your OS is up to date:

   ```text
   yum -y update
   ```

   If kernel is updated, then you need to reboot your operating system.

3. Install Kodo for Cloud repository

   * create file `/etc/yum.repos.d/kodo.repo`:

   ```text
   # Kodo for Cloud Microsoft 365 backup solution repository
   [kodo]
   name = Kodo Cloud
   baseurl = http://repo.storware.eu/kodo-cloud/current/el8
   gpgcheck=0
   ```

   * optionally  `current` can also be pointed to the specific version, i.e. `4.0` \(not the one that is always up to date\), i.e.`http://repo.storware.eu/kodo-cloud/4.0/el8`

4. Install MariaDB repository
   * generate.repo file at [MariaDB download](https://downloads.mariadb.org/mariadb/repositories) site\)
   * copy and paste generated repo file into `/etc/yum.repos.d/MariaDB.repo`, so it looks similar to this \(this one for CentOS/RHEL 8\):

     ```text
     # MariaDB 10.4 CentOS repository list - created 2020-06-01 16:14 UTC
     # http://downloads.mariadb.org/mariadb/repositories/
     [mariadb]
     name = MariaDB
     baseurl = http://yum.mariadb.org/10.4/centos8-amd64
     module_hotfixes = 1
     gpgkey = https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
     gpgcheck = 1
     ```
5. Install Microsoft repository
   * create repo configuration file `/etc/yum.repos.d/Microsoft.repo`, with the following contents:

     ```text
     # Microsoft repository
     [Microsoft]
     name = Microsoft
     baseurl = https://packages.microsoft.com/rhel/7/prod
     gpgkey = https://packages.microsoft.com/keys/microsoft.asc
     gpgcheck = 1
     ```

## Kodo for Cloud server

Kodo for Cloud consists of server \(central management point with WebUI\) and agent \(CloudAgent\), which should be installed on the same host as server. The first step is always to install the server.

1. Install kodo-cloud-server using YUM:

   ```text
   yum -y install kodo-cloud-server
   ```

2. Start and enable MariaDB service

   * Please provide a MariaDB password

   ```text
   systemctl start mariadb
   systemctl enable mariadb
   ```

3. Run MariaDB script for secure installation:

   ```text
   mysql_secure_installation
   ```

4. Initialize Kodo for Cloud server database using script - you need to provide DB root password:

   ```text
   /opt/kodo-cloud/server/bin/kodo-cloud-server-init.sh --dbrootpassword YOUR_DB_ROOT_PASSWORD
   ```

5.  Start and enable Kodo for Cloud server service \(it can take around a minute for server to be started\):

   ```text
   systemctl start kodo-cloud-server
   systemctl enable kodo-cloud-server
   ```

6. If you don't have firewall running, yet - start and enable its service:

   ```text
   systemctl start firewalld
   systemctl enable firewalld
   ```

7. Open 8181 port on your firewall. Here is example:

   ```text
   firewall-cmd --add-port=8181/tcp --permanent
   firewall-cmd --complete-reload
   ```

8. Now you should be able to log into the web console using URL: `https://KODO_SERVER_HOST:8181`, where `KODO_SERVER_HOST` isthe hostname or IP address of your Kodo Cloud Server. By default Kodo for Cloud has one global admin account \(the administrator to manage organizations\) and  another admin account in the default organization:
   * Kodo admin \(global admin\): `kodoadmin` with password `Kodo@dm1n`
   * default organization admin: `admin` with password `Kodo@dm1n` 

## Kodo Cloud Agent

Kodo Cloud Agent is the component that performs backup/restore tasks. Install it on the same host as the server.

1. Install kodo-cloud-agent using YUM:

   ```text
   yum -y install kodo-cloud-agent
   ```

2. Now follow steps described in [Staging space and backup destination configuration](staging-space-and-backup-destination-configuration.md)
3. Register agent to the server with `AGENT_NAME` of your choice, to the server `ADMIN_USER` user name which you would like to use and URL to Kodo for Cloud API and provide password when prompted.
   * syntax:

     ```text
     /opt/kodo-cloud/agent/bin/cloudagent.sh -s SERVER_HOST:SERVER_PORT -n AGENT_NAME
     ```

   * currently only local installation is supported, so you should use localhost and 8181 as the target:

     ```text
     /opt/kodo-cloud/agent/bin/cloudagent.sh -s localhost:8181 -n voyager
     ```
4. Start and enable Kodo Cloud Agent service \(notice its name contains agent name\).
   * syntax:

     ```text
     systemctl start kodo-cloud-AGENT_NAME
     systemctl enable kodo-cloud-AGENT_NAME
     ```

   * example:

     ```text
     systemctl start kodo-cloud-voyager
     systemctl enable kodo-cloud-voyager
     ```
5. Now you should be able to see new entry in `Agents` section of web UI \([kodoadmin ](../administration/dashboard.md)dashboard\)

