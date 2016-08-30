as yet unclassified
executeWith: data
	
	| execution |
	execution := TPJobExecution new.
	self firstStep process: data inExecution: execution.
	^ execution future