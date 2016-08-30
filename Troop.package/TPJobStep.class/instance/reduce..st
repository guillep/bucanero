combining
reduce: aReduction
	
	^ self connectTo: (TPMergeStep new
		merger: aReduction;
		yourself)