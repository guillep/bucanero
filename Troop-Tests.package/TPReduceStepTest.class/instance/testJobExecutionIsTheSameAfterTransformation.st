tests
testJobExecutionIsTheSameAfterTransformation

	| step next execution |
	step := TPMergeStep new.
	step merger: [ :a :e | a + e ].
	step start.

	execution := TPJobExecution new.
	execution pushContext: (TPPartitionContext new partitions: 3).
	step inputQueue nextPut: { 1 . execution }.
	step inputQueue nextPut: { 4 . execution }.
	step inputQueue nextPut: { 27 . execution }.
	200 milliSeconds wait.
	
	self deny: step outputQueue isEmpty.
	next := step outputQueue next.
	self assert: next second == execution.