dsl
newJob: aBlockClosure 
	
	| job lastStep |
	job := self new.
	lastStep := aBlockClosure value: job firstStep.
	job lastStep: lastStep.
	lastStep connectTo: TPJobEnd new.
	^ job