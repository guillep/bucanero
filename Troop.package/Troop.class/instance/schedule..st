as yet unclassified
schedule: anAction

	| futureActionPair |
	futureActionPair := anAction -> MatraFuture new.
	tasks nextPut: futureActionPair.
	^ futureActionPair value