tests
testNewIsNotRunning

	| step |
	step := TPMergeStep new.
	
	self deny: step isRunning