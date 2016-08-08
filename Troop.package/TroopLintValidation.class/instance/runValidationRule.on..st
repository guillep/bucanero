executing
runValidationRule: rule on: aTroopBuildEnvironment 
	
	^ aTroopBuildEnvironment schedule: [ :environment | | resultString |
		('Running Lint rule: ', rule name asString) logCr.
		resultString := environment command: 'eval' arguments: {
			'{rule} new run critics do: [ :each | FileStream stdout nextPutAll: each name asString; cr. ]' format: { 'rule' -> rule name } asDictionary }.
		resultString logCr.
		results := resultString lines.
		('Finished Lint rule: ', rule name asString) logCr.
		TroopLintResult new critics: results ]