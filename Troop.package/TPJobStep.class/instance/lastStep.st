accessing
lastStep
	
	nextSteps ifEmpty: [ ^ self mergingStep ].
	^ (nextSteps
		collect: [ :step | step lastStep ])
			reduce: [ :acum :each | acum mergeWith: each ]