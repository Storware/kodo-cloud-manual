# System architecture

#### KODO for Cloud agent 

Download data from O365 cloud and exposes them for KODO. To accelerate backup you can use many agent instances 

#### RabbitMQ Queue service 

Place where data received from agent awaits to be processed 

#### KODO \(api-core\) 

The brain of KODO system, where all the magic is done 

#### KODO DB \(MariaDB\) Metadata 

Spectrum Protect \(backup engine\) The heart of KODO system, place where data awaits to be restored \(after we squeeze them with deduplication and compression\)

![](../.gitbook/assets/image%20%2827%29.png)

