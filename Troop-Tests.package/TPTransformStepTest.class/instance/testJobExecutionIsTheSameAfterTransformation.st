tests
testJobExecutionIsTheSameAfterTransformation

	| step next execution |
	step := TPTransformStep new.
	step transformation: [ :p | p * 2 ].
	step start.

	execution := Object new.
	step inputQueue nextPut: {1 . execution }.
	100 milliSeconds wait.
	
	next := step outputQueue next.
	self assert: next second == execution.