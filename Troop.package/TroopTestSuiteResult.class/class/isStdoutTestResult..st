parsing
isStdoutTestResult: aString 

	^ #('[OK]' '[ERROR]' '[FAIL]' '[SKIPPED]') anySatisfy: [ :code | aString beginsWith: code ]