executing
runTestsOf: each onTroop: aTroop
	
	^ aTroop schedule: [ :environment | | resultString results |
		('Running tests: ', each asString) logCr.
		resultString := environment command: 'test' arguments: {
			'--no-xterm' .
			each }.
		resultString logCr.
		results := TroopTestSuiteResult fromStdoutString: resultString.
		('Finished running tests: ', each asString) logCr.
		results ]