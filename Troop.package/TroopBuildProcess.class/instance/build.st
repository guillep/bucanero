building
build
	
	| validations |
	validations := (buildEnvironments collect: [ :environment | 
		worker schedule: [ environment runValidations: buildValidations ] ]).
	validations do: [ :each | each valueTimeout: 1 hour ].
	
	buildEnvironments do: [ :environment |
		(baseline failures includesAll: environment failures)
			ifTrue: [ environment buildResult: TroopBuildSuccess new ]
			ifFalse: [ environment buildResult: (TroopBuildFailure new
																description: 'New failures';
																addExtraInformation: (environment failures difference: baseline failures);
																yourself) ] ] without: baseline.