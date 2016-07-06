execution
go
	
	| imagePool currentMatra |
	currentMatra := MatraImage newCurrent.
	currentMatra startServerOn: 49587.
	
	imagePool := MatraImagePool new
		poolSize: numberOfMonkeys;
		processCreationBlock: [ :pool | | image task |
			image := imageArchetype clone startClientOf: currentMatra.
			[ true ] whileTrue: [ | result |
				task := pool nextTask.
				result := image runTask: task.
				(pool futureForTask: task) deployResult: result
			]];
		yourself.
	imagePool start.
	
	[ ^ TPLoot withAll: (stages do: [ :each | each execute: imagePool ]) ] 
		ensure: [ imagePool stop ]