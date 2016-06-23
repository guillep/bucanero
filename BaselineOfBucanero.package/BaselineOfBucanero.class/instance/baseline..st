baseline
baseline: spec
	<baseline>
	spec for: #common do: [ spec
		baseline: 'Matra'
			with: [
				spec repository: 'github://guillep/Matra:master/repository' ];
		package: 'BucaneroTestRunner' with: [ spec requires: #('Matra') ] ]