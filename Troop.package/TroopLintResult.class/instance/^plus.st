arithmetic
+ aLintResult

	| result |
	result := TroopLintResult new.
	result critics: (self critics union: aLintResult critics).
	^ result