"
I'm a base activation for commands.
An activation is ""a way to activate a command"". For example: menus, toolbars, contexts, etc.
"
Class {
	#name : #LtCommandActivation,
	#superclass : #Object,
	#instVars : [
		'order'
	],
	#category : #'Lieutenant-Activation'
}

{ #category : #testing }
LtCommandActivation >> isMenuActivation [

	^ false
]

{ #category : #testing }
LtCommandActivation >> isSameAs: anActivation [
	
	^ self
]

{ #category : #testing }
LtCommandActivation >> isToolBarActivation [

	^ false
]

{ #category : #accessing }
LtCommandActivation >> order [
	^ order
]

{ #category : #accessing }
LtCommandActivation >> order: anObject [
	order := anObject
]
