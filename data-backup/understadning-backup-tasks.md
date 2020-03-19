# Understating correlation between agents, tasks, and schedules

In KODO system scheduler is a group of rules describing what, who and when should be protected. Every scheduler generate tasks based on rules mentioned above. Task describe feature \(Mailbox/Calendar/Contact/OneDrive\) and user that should be protected. Next tasks are putted into the queue and waiting there to be picked up by Agent \(tasks are putted into internal application queue – not RabbitMQ\).

**Example:**

```text
Job configuration:
    Number of protected users: 20
    Features to protect: Mailboxes, OneDrive 
Number of task:
    (no. users) * (no. of protected features) = number of task to be processed 
    20 * 2 = 40 task to proceed
```

