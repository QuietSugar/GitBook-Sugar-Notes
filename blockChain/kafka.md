## kafka操作

#### 查看kafka的状态
/opt/kafka/bin/kafka-topics.sh --zookeeper 192.168.0.123:2181 --topic "channelname" --describe

Topic:channelname	PartitionCount:1	ReplicationFactor:2	Configs:
	Topic: onbchannel	Partition: 0	Leader: 5	Replicas: 5,4	Isr: 5,4
PartitionCount:分区数量
ReplicationFactor:复制数量
Topic:主题，每一个通道对应一个主题

数据备份一定要备份kafka的数据