executing
onNext: aCollection inExecution: anExecution

	| partitions futures |
	partitions := partitioner value: aCollection.
	futures := OrderedCollection new.
	partitions do: [ :partition |
		self withNextDo: [ :each |
			futures add: (each process: partition inJobExecution: anExecution) ] ].
	(TKTFuture fromCollectionOfFutures: futures)
		onSuccessDo: [ :r | self onComplete: anExecution ]