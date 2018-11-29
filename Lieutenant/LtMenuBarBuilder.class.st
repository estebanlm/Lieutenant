"
I'm a menu builder.
"
Class {
	#name : #LtMenuBarBuilder,
	#superclass : #LtCommandActivationBuilder,
	#category : #'Lieutenant-Builder'
}

{ #category : #private }
LtMenuBarBuilder >> activationSelection [

	^ #isMenuActivation
]

{ #category : #building }
LtMenuBarBuilder >> build [ 

	^ MenuBarPresenter new addGroup: [ :group |
		(self commands groupedBy: #mainGroup) keysAndValuesDo: [ :eachGroup :items |
			group addItem: [ :item |
				item 
					name: eachGroup name;
					subMenu: (self buildMenu: items) ] ] ]
]

{ #category : #building }
LtMenuBarBuilder >> buildItem: item command: aCommand [

	item 
		name: aCommand name;
		shortcut: aCommand shortcut;
		action: [ aCommand execute ]
]

{ #category : #building }
LtMenuBarBuilder >> buildMenu: items [ 
	| menuPresenter |
	
	menuPresenter := MenuPresenter new.
	((self sortByOrder: items) 
		groupByRuns: [ :each | (self activationSelectionOf: each) group ]) 
		do: [ :eachGroup | 
			menuPresenter addGroup: [ :group |
				eachGroup do: [ :each | 
					group addMenuItem: (each asMenuItemPresenter
						enabled: (each isEnabledOn: self owner);
						yourself) ] ] ].
	
	^ menuPresenter
]
