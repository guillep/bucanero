running
runTestsStartingWith: letters

	| localLetters testCases suite |
	localLetters := letters asLocalObject.
	testCases := TestCase allSubclasses select: [ :each | 
		each isAbstract not and: [letters includes: each name first] ].
	suite := TestSuite new.
	testCases do: [ :each | suite addTest: each buildSuiteFromSelectors ].
	^ suite run