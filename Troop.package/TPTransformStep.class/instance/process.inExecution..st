proce
process: data inExecution: anExecution

	| result |
	result := transformation value: data.
	self outputQueue nextPut: { result. anExecution }.