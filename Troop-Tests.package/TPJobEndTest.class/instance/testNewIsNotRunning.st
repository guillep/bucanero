tests
testNewIsNotRunning

	| step |
	step := TPJobEnd new.

	self deny: step isRunning