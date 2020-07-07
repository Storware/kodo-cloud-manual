# Troubleshooting

To verify if services are running you can use:

* `systemctl status kodo-cloud-server` for verify Server status
* `systemctl status cloud-agent-voyager`for verify CloudAgent status

If you need to restart, stop or start KODO for Cloud server service, do as follow:

* `systemctl restart kodo-cloud-server` for Server restart
* `systemctl restart cloud-agent-voyager`for CloudAgent restart

and use the **start** and **stop** parameter respectively to trigger the action.  

If you don't find here root cause of the problem you can switch KODO for Cloud server to [DEBUG mode](how-to-enable-kodo-for-cloud-debug-mode.md), and recreate task to generate log's in DEBUG mode.

