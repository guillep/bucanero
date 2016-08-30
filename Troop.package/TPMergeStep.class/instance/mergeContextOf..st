accessing
mergeContextOf: aTPJobExecution 
	
	aTPJobExecution currentContext isMerged ifTrue: [ self error: 'Partition already merged' ].
	
	^ mergeContexts
		at: aTPJobExecution
		ifAbsentPut: [ | mergeContext |
			mergeContext := TPMergeContext new.
			mergeContext partitionContext: aTPJobExecution currentContext.
			self hasInitialValue ifTrue: [ mergeContext setInitialValue: initialValue value ].
			mergeContext yourself ]