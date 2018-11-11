Class {
	#name : #LtMenuActivation,
	#superclass : #LtCommandActivation,
	#instVars : [
		'group'
	],
	#category : #'Lieutenant-Activation'
}

{ #category : #accessing }
LtMenuActivation >> group [
	"A menu group indicates how the command will be arranged inside a menu"

	^ group
]

{ #category : #accessing }
LtMenuActivation >> group: anIdentifier [
	"Group can be anything that can be used as an identifier. 
	 We usually use symbols, but is not restricted to it. 
	 Groups will be secondary to order: order will be calculated first and groups later (which 
	 means it can lead to some weird grouping if not used properly)"

	group := anIdentifier
]

{ #category : #testing }
LtMenuActivation >> isMenuActivation [ 

	^ true
]
