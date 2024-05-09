@tool
extends Node3D

## FIELDS
# OBJECTS
@onready var slots: Array[Area3D] = [
	$SummonSlot1, $SummonSlot2, $SummonSlot3, $SummonSlot4
]

# SPRITE SLOTS
@export var summons: Array[PackedScene]:
	set(new_summons):
		summons = new_summons
		summons.resize(4)

## METHODS
# BASE
func _ready() -> void:
	update_summons()

func _process(delta) -> void:
	pass
	
func _get_configuration_warnings() -> PackedStringArray:
	if slots[0] and slots[1] and slots[2] and slots[3]:
		return []
	return ["Missing one or more required Summon Slots!"]

# MANAGE SPRITES
func update_summons() -> void:
	for i in range(0, 4):
		if summons[i]:
			slots[i].set_object(summons[i].instantiate())
