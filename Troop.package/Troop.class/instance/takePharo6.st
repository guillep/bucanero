planification
takePharo6
	
	imageArchetype := MatraImageArchetype on: ('temp' asFileReference / UUID new asString) version: 60 vmVersion: 'latest'.
	stages add: (TPLoadImageStage new archetype: imageArchetype)