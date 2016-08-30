subscription
connectTo: aStep
	
	aStep job: self job.
	aStep inputQueue: self outputQueue.
	self job addStep: aStep.
	^ aStep