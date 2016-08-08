instance-creation
fromStdoutString: aString 
	
	| result lines |
	result := self new.
	lines := aString lines readStream.
	[ lines atEnd ] whileFalse: [ | line |
		line := lines next.
		(self isStdoutTestResult: line)
			ifTrue: [ self createStdoutTestResultForLine: line fromStream: lines ]
			ifFalse: [ result addDescription: line ].	
	].
	^ result