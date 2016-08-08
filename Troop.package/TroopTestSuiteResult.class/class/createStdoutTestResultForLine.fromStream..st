parsing
createStdoutTestResultForLine: aString fromStream: linesStream
	
	| result |
	result := TroopTestResult withCommandLine: aString.
	result notPassed ifFalse: [ 
		[ linesStream peek notNil and: [ (self isStdoutTestResult: linesStream peek) not ] ]
			whileTrue: [ result addDescription: linesStream next ] ].
	^ result