# Common problems

### Check the status of KODO for Cloud server

Check if KODO for Cloud server is working.

You can check the server status by using this shell script:  
`/opt/kodo-cloud/server/bin/status.sh`

or can check the server status by using this command:

`systemctl status kodo-cloud-server`

You can check KODO for Cloud server version using a web browser:  
`https://KODO_server_IP:8181/api/version`

### Check the status of KODO for Cloud `agent` 

You can check the cloud agent status by using this command:

`systemctl status cloud-agent-agent_name`

The default cloud agent name is voyager, so the command would be:

`systemctl status cloud-agent-voyager`

## Contact our support when something went wrong

In case of any installation problems please contact with [Storware Support Team](mailto:support@storware.eu) or one of our local [partners](https://storware.eu/en/partners/).

