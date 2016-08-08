as yet unclassified
executeTask: futureActionPair

	| future task |
	future := futureActionPair value.
	task := futureActionPair key.
	[ future deployResult: (task cull: image) ] 
		on: Error
		do: [ :exception | future deployException: exception ].
	troop releaseMonkey: self.