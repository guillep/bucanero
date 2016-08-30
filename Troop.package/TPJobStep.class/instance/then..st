combining
then: aNextStep
	
	| job |
	job := TPJob new.
	job addStep: self.
	job addStep: aNextStep.
	self connectTo: aNextStep.
	^ job