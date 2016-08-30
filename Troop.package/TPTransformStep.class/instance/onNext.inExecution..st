as yet unclassified
onNext: data inExecution: anExecution

	self schedule: [ 
		anExecution
			setValue: (transformation value: data);
			complete ].