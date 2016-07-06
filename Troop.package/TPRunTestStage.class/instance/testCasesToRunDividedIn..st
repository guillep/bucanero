execution
testCasesToRunDividedIn: groupSize

	| total |
	total := TestCase allSubclasses reject: #isAbstract.
	^ (total groupedBy:
			[ :c | ((total indexOf: c) // (total size / groupSize )) ])
		values collect: [:each | each collect: #name].