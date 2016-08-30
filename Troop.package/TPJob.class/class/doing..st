dsl
doing: aBlockClosure 
	
	^ (self newJob: aBlockClosure)
		start;
		yourself