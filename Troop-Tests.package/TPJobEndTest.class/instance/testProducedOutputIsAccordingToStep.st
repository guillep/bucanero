tests
testProducedOutputIsAccordingToStep

	| step execution |
	step := TPJobEnd new.
	step start.
	execution := TPJobExecution new.
	step inputQueue nextPut: {1 . execution }.

	self assert: (execution future synchronizeTimeout: 1 second) equals: 1.