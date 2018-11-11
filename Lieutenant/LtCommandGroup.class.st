"
I'm a base group of commands.
"
Class {
	#name : #LtCommandGroup,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Lieutenant-Base'
}

{ #category : #'instance creation' }
LtCommandGroup class >> new [ 

	self error: 'Use #uniqueInstance'
]

{ #category : #'instance creation' }
LtCommandGroup class >> uniqueInstance [

	self = LtCommandGroup ifTrue: [  
		self error: 'I''m abstract. Use one of my children instead.' ].
	^ uniqueInstance ifNil: [ uniqueInstance := self basicNew initialize ]
]

{ #category : #accessing }
LtCommandGroup >> commands [ 

	^ LtCommand allAvailable select: [ :each | each group = self ]
]

{ #category : #accessing }
LtCommandGroup >> name [
	^ name
]

{ #category : #accessing }
LtCommandGroup >> name: anObject [
	name := anObject
]

{ #category : #printing }
LtCommandGroup >> printOn: stream [ 

	stream << 'Group: ' << self name
]
