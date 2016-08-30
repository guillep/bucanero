as yet unclassified
testCollectInputQueueIsPreviousOutputQueue

	| start transform |
	start := TPJob new newJobStart.
	transform := start collect: [ :v | v * 2 ].
	
	self assert: start outputQueue equals: transform inputQueue