combining
reduce: aReduction withInitialValue: anInitialValueFactory 
	
	^ self connectTo: (TPMergeStep new
		initialValue: anInitialValueFactory;
		merger: aReduction;
		yourself)