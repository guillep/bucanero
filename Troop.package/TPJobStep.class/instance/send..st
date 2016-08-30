combining
send: data

	^ TKTFuture fromCollectionOfFutures: (nextSteps collect: [ :next | next process: data ])