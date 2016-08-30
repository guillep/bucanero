tests
testDoesNotProduceOutput

	| step execution |
	step := TPJobEnd new.
	step start.
	execution := TPJobExecution new.
	step inputQueue nextPut: {1 . execution }.
	100 milliSeconds wait.
	
	self assert: step outputQueue isEmpty.