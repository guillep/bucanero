accessing
failures
	
	^ self results select: [ :r | r notPassed ]