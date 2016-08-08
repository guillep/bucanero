actions
loadSlice: aString 
	
	^ self schedule: [ :environment |
		environment command: 'eval' arguments: { '--save'.
			'Gofer it
				smalltalkhubUser: ''Pharo'' project: ''Pharo60Inbox'';
				version: ''{version}'';
				fetch'	 format: { 'version' -> aString } asDictionary.
		 }.
		environment
	]