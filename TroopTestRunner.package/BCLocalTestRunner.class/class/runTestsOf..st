running
runTestsOf: remoteClassNames

	| suite |
	('Runninng...' , remoteClassNames asLocalObject asString) logCr.
	suite := TestSuite new.
	remoteClassNames do: [ :each | suite addTest: (Smalltalk at: each) buildSuiteFromSelectors ].
	^ suite run