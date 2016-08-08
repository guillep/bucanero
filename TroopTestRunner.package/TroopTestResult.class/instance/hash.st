as yet unclassified
hash

	^ (test hash << 2) + (#('FAIL' 'ERROR' 'SKIPPED' 'OK') indexOf: result)