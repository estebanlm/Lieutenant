"
I'm a base command. 
I define basic behaviour. 

My children should implement #execute.
"
Class {
	#name : #LtCommand,
	#superclass : #Object,
	#instVars : [
		'groups',
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

	^ self allSubclasses 
		reject: #isAbstract
		thenCollect: #new
]

{ #category : #accessing }
LtCommand class >> allMatching: aBlock [

	^ self allAvailable select: aBlock
]

{ #category : #testing }
LtCommand class >> isAbstract [ 

	^ self = LtCommand
]

{ #category : #'accessing activations' }
LtCommand >> activationLike: aBlock [

	^ self class activations 
		detect: aBlock 
		ifNone: [ nil ]
]

{ #category : #accessing }
LtCommand >> addGroup: aCommandGroup [

	groups ifNil: [ groups := #() ].
	groups := groups copyWith: aCommandGroup
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
LtCommand >> groups [

	^ groups ifNil: [ #() ]
]

{ #category : #'accessing activations' }
LtCommand >> hasActivationLike: aBlock [

	^ (self activationLike: aBlock) notNil
]

{ #category : #testing }
LtCommand >> hasGroup: aGroup [ 

	^ self groups includes: aGroup
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
LtCommand >> mainGroup [
	"While a command can belong to different groups, it will have just one main group (the first)"

	^ groups ifNotNil: [ groups first ]
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
