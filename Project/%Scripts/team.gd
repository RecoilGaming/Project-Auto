extends Node3D

## FIELDS
@onready var slots: Array[Area3D] = [$Slot1, $Slot2, $Slot3, $Slot4, $Slot5]
@export var souls: Array[SoulData]:
	set(new_souls):
		souls = new_souls
		souls.resize(5)

## METHODS
func _ready() -> void:
	_update()
	
func _update() -> void:
	for i in range(0, 5):
		slots[i].data = souls[i]
		if (slots[i].data): print(slots[i].data.name)
