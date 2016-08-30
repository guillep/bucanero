tests
testCollectCreatesTransformationStep

	| start transform |
	start := TPJob new newJobStart.
	transform := start collect: [ :v | v * 2 ].
	
	self assert: transform isTransformationStep.