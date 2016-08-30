tests
testNewIsNotRunning

	| step |
	step := TPTransformStep new.

	self deny: step isRunning