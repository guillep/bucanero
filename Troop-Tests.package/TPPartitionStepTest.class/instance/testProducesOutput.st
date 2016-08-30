tests
testProducesOutput

	| step execution |
	step := TPPartitionStep new.
	step partitioner: [ :p | p even ].
	step start.

	execution := TPJobExecution new.
	step inputQueue nextPut: { #( 1 2 3 4 5 ) . execution }.
	100 milliSeconds wait.
	
	self deny: step outputQueue isEmpty.