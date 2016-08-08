executing
runValidationOn: aTroop

	| futures |
	futures := self partitions collect: [ :each | self runValidationRule: each on: aTroop ].

	^ futures allButFirst
		inject: (futures first valueTimeout: 10 hours)
		into: [ :a :b | a + (b valueTimeout: 10 hours) ]