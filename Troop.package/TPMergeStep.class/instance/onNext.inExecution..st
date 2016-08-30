processing
onNext: data inExecution: execution

	self schedule: [
		execution hasValue
			ifFalse: [ 
				self hasInitialValue
					ifTrue: [ 
						execution setValue: initialValue copy.
						execution setValue: (merger value: execution currentValue value: data) ]
					ifFalse: [
						execution setValue: data ] ]
			ifTrue: [ execution setValue: (merger value: execution currentValue value: data) ] ]