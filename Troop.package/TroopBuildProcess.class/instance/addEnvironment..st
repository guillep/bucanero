configuration
addEnvironment: aBuildEnvironment

	^ buildEnvironments add: (TroopBuildEnvironment new archetype: aBuildEnvironment; yourself)