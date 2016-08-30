as yet unclassified
testPartitionByCreatesPartitionStep

	| start transform |
	start := TPJob new newJobStart.
	transform := start partitionedBy: [ :v | v // 2 ].
	
	self assert: transform isPartitionStep.