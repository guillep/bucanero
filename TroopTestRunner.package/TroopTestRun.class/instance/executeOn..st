executing
executeOn: aTroop

	| futures |
	futures := self partitions collect: [ :each | self runTestsOf: each onTroop: aTroop ].

	^ futures allButFirst
		inject: (futures first valueTimeout: 10 hours)
		into: [ :a :b | a + (b valueTimeout: 10 hours) ]