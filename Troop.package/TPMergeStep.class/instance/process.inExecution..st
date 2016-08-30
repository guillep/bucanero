executing
process: data inExecution: anExecution

	| mergeContext |
	mergeContext := self mergeContextOf: anExecution.
	(mergeContext hasValue not)
		ifTrue:  [ mergeContext mergeValue: data ]
		ifFalse: [ mergeContext mergeValue: (merger value: mergeContext getValue value: data) ].
	mergeContext isMerged
		ifTrue: [ self outputQueue nextPut: { mergeContext getValue . anExecution } ].