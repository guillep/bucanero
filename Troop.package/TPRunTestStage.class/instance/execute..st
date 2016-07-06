execution
execute: imagePool

	| testCaseNameGroups futures globalTestResult |
	testCaseNameGroups := self testCasesToRunDividedIn: imagePool poolSize * 2.
	futures := testCaseNameGroups collect: [ :names |
		imagePool scheduleTask: [ BCLocalTestRunner runTestsOf: names ] ].


	futures do: [:each |
		each
			onExceptionDo: [:e | e logCr ];
			onTimeoutDo: [ 'timeout' ];
			waitForValue: 10 minutes ].

	globalTestResult := TestResult new.
	futures do: [:each | | testResult |
		testResult := each value.
		testResult basicErrors do: [ :e | globalTestResult addError: ((e asLocalObject) instVarNamed: 'expectedFails' put: nil; yourself)  ].
		testResult basicPassed do: [ :e | globalTestResult addPass: ((e asLocalObject) instVarNamed: 'expectedFails' put: nil; yourself)  ].
		testResult basicSkipped do: [ :e | globalTestResult addSkip: ((e asLocalObject) instVarNamed: 'expectedFails' put: nil; yourself)  ].
		testResult basicFailures do: [ :e | globalTestResult addFailure: ((e asLocalObject) instVarNamed: 'expectedFails' put: nil; yourself) ] ].
	
	^ globalTestResult