# Disaster Recovery

## Internal Database Protection <a id="internal-database-protection"></a>

Kodo for Cloud stores all of the metadata in the local database. It is **highly recommended** to setup periodic DB backup on Kodo for Cloud Server.   
To backup your database u can use **mysqldump** command**:**  
syntax:

```text
#mysqldump -u [user] -p [database_name] > [filename].sql
```

example:

```text
#mysqldump -u root -p kodo > kodo_backup.sql
```

Once you have your backup you can restore DB with the **mysql** command:  
syntax:

```text
#mysql -u [user] -p [database_name] < [filename].sql
```

example:

```text
#mysql -u root -p kodo < kodo_backup.sql
```

In case of a complete loss of the Kodo for Cloud Server:

1. Backup Kodo for Cloud Server configuration directory:

   ```text
   #cp -r /opt/kodo-cloud/server/config /YOUR_BACKUP_DESTINATION
   ```

2. Reinstall Kodo for Cloud Server
   * if you lost your license file please contact support
3. Before starting Kodo for Cloud Server - restore the database
4. Start Kodo for Cloud Server service
5. Install Kodo for Cloud Agent
6. Make sure the storage is available 
7. Run your Agent

At this point, Kodo for Cloud should be ready to protect your organizations.

