Class {
	#name : #Contact,
	#superclass : #Object,
	#instVars : [
		'name',
		'phone'
	],
	#category : #'Lieutenant-Example'
}

{ #category : #'instance creation' }
Contact class >> named: aString phone: aString2 [
  ^ self new
    name: aString;
    phone: aString2;
    yourself
]

{ #category : #accessing }
Contact >> name [
	^ name
]

{ #category : #accessing }
Contact >> name: anObject [
	name := anObject
]

{ #category : #accessing }
Contact >> phone [
	^ phone
]

{ #category : #accessing }
Contact >> phone: anObject [
	phone := anObject
]

{ #category : #printing }
Contact >> printOn: aStream [
  super printOn: aStream.
  aStream nextPut: $(.
  aStream nextPutAll: name.
  aStream nextPut: $).
]
