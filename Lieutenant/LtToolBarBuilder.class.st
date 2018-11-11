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

	self flag: #TODO. "icons/text/both needs to come from application configuration"
	toolBar := ToolBarPresenter new beIcons. 
	(self commands groupedBy: #group) valuesDo: [ :items | 
		(self sortByOrder: items) do: [ :each | 
			toolBar addItem: each asToolBarButton ] ].
	^ toolBar	
]

{ #category : #accessing }
LtToolBarBuilder >> commands [ 

	^ super commands select: [ :each | 
		each isVisibleOn: self owner ]
]
