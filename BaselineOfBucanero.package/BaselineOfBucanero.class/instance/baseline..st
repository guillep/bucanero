baseline
baseline: spec
	<baseline>
	spec for: #common do: [ spec
		configuration: 'Matra'
			with: [
				spec repository: 'github://guillep/Matra:master/repository' ];
		package: 'Bucanero' with: [ spec requires: #('Matra') ] ]