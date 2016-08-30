processing
process: aPieceOfData

	| future |
	future := TKTFuture new.
	workerPool schedule: [ | result |
		aPieceOfData = #done
			ifTrue: [ result := #done ]
			ifFalse: [ result := distributedTask value: aPieceOfData ].
		(self send: result)
				onSuccessDo: [ :v | future deploySuccess: v flattened ];
				onFailureDo: [ :e | future deployFailure: e flattened ] ].
	^ future