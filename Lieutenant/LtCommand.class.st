"
I'm a base command. 
I define basic behaviour. 

My children should implement #execute.
"
Class {
	#name : #LtCommand,
	#superclass : #Object,
	#instVars : [
		'group',
		'name',
		'description',
		'icon',
		'iconName',
		'shortcut'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Lieutenant-Base'
}

{ #category : #accessing }
LtCommand class >> activations [
	"Answer a list of possible activations"

	^ #()
]

{ #category : #accessing }
LtCommand class >> allAvailable [

	^ (self allSubclasses 
		reject: #isAbstract)
		collect: #uniqueInstance
]

{ #category : #accessing }
LtCommand class >> allAvailableFor: anObject [

	^ self allAvailable
		select: [ :each | anObject handlesCommand: each ]
]

{ #category : #'instance creation' }
LtCommand class >> new [

	self error: 'Use #uniqueInstance'
]

{ #category : #utilities }
LtCommand class >> reset [ 

	uniqueInstance := nil
]

{ #category : #utilities }
LtCommand class >> resetAll [ 
	<script> 

	self allSubclassesDo: #reset.
]

{ #category : #'instance creation' }
LtCommand class >> uniqueInstance [

	self isAbstract ifTrue: [ 
		self error: 'I''m abstract. You cannot use me direction.' ].
	^ uniqueInstance ifNil: [ uniqueInstance := self basicNew initialize ]	
]

{ #category : #'accessing activations' }
LtCommand >> activationLike: aBlock [

	^ self class activations 
		detect: aBlock 
		ifNone: [ nil ]
]

{ #category : #converting }
LtCommand >> asMenuItemPresenter [

	^ MenuItemPresenter new 
		name: self name;
		shortcut: self shortcut;
		action: [ self execute ];
		yourself
]

{ #category : #converting }
LtCommand >> asToolBarButton [
	
	^ ToolBarButton new 
		label: self name;
		icon: self icon;
		help: self description;
		action: [ self execute ];
		yourself
]

{ #category : #accessing }
LtCommand >> description [

	^ description
]

{ #category : #accessing }
LtCommand >> description: aString [

	description := aString
]

{ #category : #execution }
LtCommand >> execute [ 
	"Do nothing"
]

{ #category : #accessing }
LtCommand >> group [

	^ group
]

{ #category : #accessing }
LtCommand >> group: aGroup [

	group := aGroup
]

{ #category : #'accessing activations' }
LtCommand >> hasActivationLike: aBlock [

	^ (self activationLike: aBlock) notNil
]

{ #category : #accessing }
LtCommand >> icon [

	^ self iconName ifNotNil: [ :aName | 
		self iconNamed: aName asSymbol ]
]

{ #category : #accessing }
LtCommand >> iconName [
	
	^ iconName
]

{ #category : #accessing }
LtCommand >> iconName: aString [
	
	iconName := aString
]

{ #category : #testing }
LtCommand >> isEnabledOn: anObject [

	^ self isVisibleOn: anObject
]

{ #category : #testing }
LtCommand >> isVisibleOn: anObject [

	^ true
]

{ #category : #accessing }
LtCommand >> name [

	^ name
]

{ #category : #accessing }
LtCommand >> name: aString [

	name := aString
]

{ #category : #printing }
LtCommand >> printOn: stream [ 

	stream << 'Command: ' << self name
]

{ #category : #accessing }
LtCommand >> shortcut [

	^ shortcut
]

{ #category : #accessing }
LtCommand >> shortcut: aShortcut [

	shortcut := aShortcut
]
