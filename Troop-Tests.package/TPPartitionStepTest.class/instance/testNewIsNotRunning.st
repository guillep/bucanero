tests
testNewIsNotRunning

	| step |
	step := TPPartitionStep new.

	self deny: step isRunning