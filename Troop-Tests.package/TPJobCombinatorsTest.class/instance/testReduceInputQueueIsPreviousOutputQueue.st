as yet unclassified
testReduceInputQueueIsPreviousOutputQueue

	| start transform |
	start := TPJob new newJobStart.
	transform := start reduce: [ :acum :each | acum + each ].
	
	self assert: start outputQueue equals: transform inputQueue