baseline
baseline: spec
	<baseline>
	spec for: #common do: [
		spec baseline: 'TaskIt' with: [ spec
			repository: 'github://sbragagnolo/taskit:v0.2' ].
		spec package: 'Troop' with: [ spec requires: #('TaskIt') ].
		spec package: 'Troop-Tests' with: [ spec requires: #('Troop') ] ]
