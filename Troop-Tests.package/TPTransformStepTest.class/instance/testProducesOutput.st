tests
testProducesOutput

	| step |
	step := TPTransformStep new.
	step transformation: [ :p | p * 2 ].
	step start.

	step inputQueue nextPut: {1 .nil }.
	100 milliSeconds wait.
	
	self deny: step outputQueue isEmpty.