baseline
baseline: spec
	<baseline>
	spec for: #common do: [ 
		spec package: 'Troop'.
		spec package: 'Troop-Tests' with: [ spec requires: #('Troop') ] ]
