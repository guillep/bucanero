as yet unclassified
initialize

	super initialize.
	steps := OrderedCollection new.
	firstStep := self addStep: self newJobStart.