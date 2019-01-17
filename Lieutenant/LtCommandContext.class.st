Class {
	#name : #LtCommandContext,
	#superclass : #Object,
	#instVars : [
		'owner'
	],
	#category : #'Lieutenant-Base'
}

{ #category : #accessing }
LtCommandContext >> owner [
	^ owner
]

{ #category : #accessing }
LtCommandContext >> owner: anObject [
	owner := anObject
]
