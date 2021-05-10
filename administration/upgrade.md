# Upgrade

 Please check the versions of installed packages before every update. Database version is particularly important. Use the following commands:

```text
yum info kodo-cloud-serve kodo-cloud-agent mariadb-server
# Or
rpm -qa | egrep -e "kodo-cloud|Maria"
```

If the host computer has an Internet connection, use the yum command, you'll also see the new package versions provided by the repositories.



