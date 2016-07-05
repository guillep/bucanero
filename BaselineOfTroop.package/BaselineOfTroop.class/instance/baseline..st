baseline
baseline: spec
	<baseline>
	spec for: #common do: [ spec
		baseline: 'Matra'
			with: [
				spec repository: 'github://guillep/Matra:master' ];
		package: 'TroopTestRunner' with: [ spec requires: #('Matra') ] ]
