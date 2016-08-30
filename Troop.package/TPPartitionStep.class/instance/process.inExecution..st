executing
process: data inExecution: anExecution

	| result |
	result := (data groupedBy: partitioner) values.
	anExecution pushContext: (TPPartitionContext new partitions: result size).
	result do: [ :partition |
		self outputQueue
			nextPut: { partition . anExecution } ].
