as yet unclassified
testReduceCreatesReductionStep

	| start transform |
	start := TPJob new newJobStart.
	transform := start reduce: [ :acum :each | acum + each ].
	
	self assert: transform isReductionStep.