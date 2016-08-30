combining
, aTPTroop 
	
	| job |
	job := TPJob new.
	job addStep: self.
	job addStep: aTPTroop.
	^ job