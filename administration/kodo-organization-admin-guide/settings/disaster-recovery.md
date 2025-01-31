# Disaster Recovery

## Internal Database Protection <a href="#internal-database-protection" id="internal-database-protection"></a>

Kodo for Cloud stores all of the metadata in the local database. It is **highly recommended** to setup periodic DB backup on Kodo for Cloud Server. To backup your database u can use **mysqldump** comman&#x64;**:**\
syntax:

```
#mysqldump -u [user] -p [database_name] > [filename].sql
```

example:

```
#mysqldump -u root -p kodo > kodo_backup.sql
```

Once you have your backup you can restore DB with the **mysql** command:\
syntax:

```
#mysql -u [user] -p [database_name] < [filename].sql
```

example:

```
#mysql -u root -p kodo < kodo_backup.sql
```

## Configuration Protection

1.  Copy KODO for Cloud Server configuration directory:

    ```
    #cp -r /opt/kodo-cloud/server/config /YOUR_BACKUP_DESTINATION
    ```
2. Reinstall KODO for Cloud Server
   * if you lost your license file please contact support
3. Before starting KODO for Cloud Server - restore the database
4. Start KODO for Cloud Server service
5. Install Kodo for Cloud Agent
6. Make sure the storage is available&#x20;
7. Run your Agent
