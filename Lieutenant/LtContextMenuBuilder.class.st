Class {
	#name : #LtContextMenuBuilder,
	#superclass : #LtMenuBarBuilder,
	#category : #'Lieutenant-Builder'
}

{ #category : #building }
LtContextMenuBuilder >> build [ 
	
	^ self buildMenu: self commands
]
