combininb
partitionedBy: aPartitioner
	
	^ self connectTo: (TPPartitionStep new partitioner: aPartitioner; yourself)