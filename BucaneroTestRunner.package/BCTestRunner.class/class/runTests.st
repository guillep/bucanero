running
runTests
	| numberOfGroups total groups currentMatra futureChildImages futureTestResults globalTestResult |
	[ numberOfGroups := 40.
	total := TestCase allSubclasses reject: #isAbstract.
	groups := (total
		groupedBy:
			[ :c | ((total indexOf: c) // (total size / numberOfGroups)) ])
		values collect: [:each | each collect: #name].

	currentMatra := MatraImage newCurrent.
	currentMatra startServerOn: 49587.
	
	globalTestResult := TestResult new.
	
	futureChildImages := groups
		collect: [ :each | 
			{ each . MatraFuture doing: [ | child |
				child := currentMatra archetype clone startClientOf: currentMatra.
				self assert: child isConnected.
				FileStream stdout nextPutAll: 'child connected'; cr.
				child] } ].

	futureTestResults := futureChildImages collect: [ :each | 
			MatraFuture doing: [ | runner  |
 				runner := (each second valueTimeout: 30 seconds) get: BCLocalTestRunner name.
				FileStream stdout nextPutAll: 'got runner'; cr.
				runner runTestsOf: each first. ] ].
	
	^ (MatraFuture doing: [
		futureTestResults collect: [:each |
			(MatraFuture doing: [ | testResult |
				testResult := (each valueTimeout: 360 seconds).
				testResult basicErrors do: [ :e | globalTestResult addError: ((e asLocalObject) instVarNamed: 'expectedFailes' put: nil; yourself)  ].
				testResult basicPassed do: [ :e | globalTestResult addPass: ((e asLocalObject) instVarNamed: 'expectedFailes' put: nil; yourself)  ].
				testResult basicSkipped do: [ :e | globalTestResult addSkip: ((e asLocalObject) instVarNamed: 'expectedFailes' put: nil; yourself)  ].
				testResult basicFailures do: [ :e | globalTestResult addFailure: ((e asLocalObject) instVarNamed: 'expectedFailes' put: nil; yourself) ]
				])
			onExceptionDo: [:e | e];
			onTimeoutDo: [ 'timeout' ];
			valueTimeout: 10 seconds ].
		globalTestResult ]) valueTimeout: 360 seconds.
	
	] ensure: [ currentMatra ifNotNil: #stopServer ]
