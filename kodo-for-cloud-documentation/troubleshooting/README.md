# Troubleshooting

To verify if services are running you can use the following commands:

* `systemctl status kodo-cloud-server` for verifying KOOD for Cloud service status.
* `systemctl status cloud-agent-voyagere`for verifying CloudAgent service status \(for the agent **voyager**\).

If you need to restart, stop, or start KODO for Cloud server service, do as follow:

* `systemctl restart kodo-cloud-server` for KODO for Cloud server restart
* `systemctl restart cloud-agent-voyager`for CloudAgent agent **voyager**  restart

and use the **start** and **stop** parameters respectively to trigger the action.  

If you don't find here root cause of the problem you can switch KODO for Cloud server to [DEBUG mode](../../troubleshooting/how-to-enable-kodo-for-cloud-debug-mode.md), and recreate tasks to generate logs in DEBUG mode.

