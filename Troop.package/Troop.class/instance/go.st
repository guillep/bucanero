actions
go

	self ensureTroop.
	[ tasks isEmpty ] whileFalse: [ | task |
		task := tasks next.
		('Scheduling task. ', tasks size asString, ' to go')  logCr.
		[ self getFreeMonkey executeTask: task ] fork.
	]