"
I'm a base builder for commands.
"
Class {
	#name : #LtCommandActivationBuilder,
	#superclass : #Object,
	#instVars : [
		'owner'
	],
	#category : #'Lieutenant-Builder'
}

{ #category : #convenience }
LtCommandActivationBuilder class >> buildFor: anObject [ 

	^ self new 
		owner: anObject;
		build
]

{ #category : #accessing }
LtCommandActivationBuilder >> activationSelection [
	"This will define how this builder gets the activation it builds"

	^ self subclassResponsibility
]

{ #category : #accessing }
LtCommandActivationBuilder >> activationSelectionOf: anObject [ 

	^ anObject activationLike: self activationSelection
]

{ #category : #accessing }
LtCommandActivationBuilder >> commands [

	^ (LtCommand allAvailableFor: self owner) 
		select: [ :each | each hasActivationLike: self activationSelection ]
]

{ #category : #accessing }
LtCommandActivationBuilder >> owner [
	^ owner
]

{ #category : #accessing }
LtCommandActivationBuilder >> owner: anObject [
	owner := anObject
]

{ #category : #private }
LtCommandActivationBuilder >> sortByOrder: items [
			
	^ items sorted: [ :a :b | 
		(self activationSelectionOf: a) order < (self activationSelectionOf: b) order ]
]
