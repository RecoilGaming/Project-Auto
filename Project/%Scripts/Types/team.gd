extends Node2D

## FIELDS
@onready var slots: Array[Area2D] = [$Slot1, $Slot2, $Slot3, $Slot4, $Slot5]
@export var souls: Array[SoulData] = [null, null, null, null, null]
@export var mutable: bool = 1

## METHODS
func _ready() -> void:
	_update()
	
func _update() -> void:
	for slot in slots:
		slot.mutable = mutable
