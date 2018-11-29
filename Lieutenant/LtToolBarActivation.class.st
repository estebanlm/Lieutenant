Class {
	#name : #LtToolBarActivation,
	#superclass : #LtCommandActivation,
	#instVars : [
		'position'
	],
	#category : #'Lieutenant-Activation'
}

{ #category : #accessing }
LtToolBarActivation >> bePositionLeft [ 

	self position: ToolBarItemPosition left
]

{ #category : #accessing }
LtToolBarActivation >> bePositionRight [ 

	self position: ToolBarItemPosition right
]

{ #category : #initialization }
LtToolBarActivation >> initialize [

	super initialize.
	self bePositionLeft
]

{ #category : #testing }
LtToolBarActivation >> isToolBarActivation [

	^ true
]

{ #category : #accessing }
LtToolBarActivation >> position [
	^ position
]

{ #category : #private }
LtToolBarActivation >> position: anObject [
	position := anObject
]
