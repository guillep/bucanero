actions
runTests
	
	^ MatraFuture doing: [ 
		TroopTestRun new
			executeOn: self ]