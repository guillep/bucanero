accessing
mergingStep
	
	| mergeStep |
	mergeStep := TPMergeStep new
		initialValue: OrderedCollection new;
		merger: [ :a :b | a add: b; yourself ].
	self addNextStep: mergeStep.
	^ mergeStep