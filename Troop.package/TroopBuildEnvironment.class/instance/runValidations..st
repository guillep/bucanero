runnning
runValidations: aCollection 

	environmentPool := TroopEnvironmentPool new.
	environmentPool archetype: archetype.
	environmentPool poolSize: 4.
	environmentPool start.
	
	aCollection do: [ :each | 
		self addValidationResults: (each runValidationOn: self) ].