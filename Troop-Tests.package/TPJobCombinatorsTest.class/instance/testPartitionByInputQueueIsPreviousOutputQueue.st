as yet unclassified
testPartitionByInputQueueIsPreviousOutputQueue

	| start transform |
	start := TPJob new newJobStart.
	transform := start partitionedBy: [ :v | v // 2 ].
	
	self assert: start outputQueue equals: transform inputQueue