tests
testProducedOutputIsAccordingToStep

	| step next |
	step := TPTransformStep new.
	step transformation: [ :p | p * 2 ].
	step start.

	step inputQueue nextPut: {1 .nil }.
	100 milliSeconds wait.
	
	next := step outputQueue next.
	self assert: next first equals: 2.