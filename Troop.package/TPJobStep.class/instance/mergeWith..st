combining
mergeWith: aStep
	
	| mergeStep |
	mergeStep := TPMergeStep new.
	self addNextStep: mergeStep.
	aStep addNextStep: mergeStep.
	^ mergeStep