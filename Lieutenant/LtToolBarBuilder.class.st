"
I'm a toolbar builder.
"
Class {
	#name : #LtToolBarBuilder,
	#superclass : #LtCommandActivationBuilder,
	#category : #'Lieutenant-Builder'
}

{ #category : #private }
LtToolBarBuilder >> activationSelection [

	^ #isToolBarActivation
]

{ #category : #building }
LtToolBarBuilder >> build [ 
	| toolBar |

	toolBar := ToolBarPresenter new.
	toolBar beIcons.
	(self commands groupedBy: [ :each | (self activationSelectionOf: each) position ]) 
		keysAndValuesDo: [ :position :items | 
			(self sortByOrder: items) do: [ :each | 
				toolBar 
					addItem: (each asToolBarButton
						action: [ each executeOn: self newContext ];
						yourself) 
					position: position ] ].

	^ toolBar	
]

{ #category : #accessing }
LtToolBarBuilder >> commands [ 

	^ super commands select: [ :each | 
		each isVisibleOn: self owner ]
]

{ #category : #factory }
LtToolBarBuilder >> newContext [

	^ LtCommandContext new 
		owner: self owner;
		yourself
]
