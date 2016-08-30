start-stop
scheduleRecursive
	
	worker schedule: [ | next |
		next := self inputQueue next.
		self process: next first inExecution: next second.
		self scheduleRecursive ]