combining
collect: transformer

	^ self connectTo: (TPTransformStep new transformation: transformer; yourself)