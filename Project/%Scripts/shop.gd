extends Node2D

## FIELDS
@onready var slots: Array[Area2D] = [
	null,
	$Team/Slot1, $Team/Slot2, $Team/Slot3, $Team/Slot4, $Team/Slot5,
	$Stock1, $Stock2, $Stock3, $Stock4, $Stock5
]

var selected: int = -1
var has_selected: bool = 0

const idols: Array[int] = [0]
const souls: Array[int] = [1, 2, 3, 4, 5]
const stock: Array[int] = [6, 7, 8, 9, 10]

## METHODS
# Base
func _ready() -> void:
	SignalHub.select_soul.connect(select)

# Selecting
func select(src: int) -> void:
	if (has_selected):
		slots[selected].unhighlight(1)
		for i in range(1, slots.size()):
			slots[i].enable()
		if (selected in souls and src in souls):
			swap(selected, src)
		elif (selected in stock and src in souls):
			pass
	else:
		slots[src].highlight(1)
		for i in get_disabled(src):
			slots[i].disable()
		selected = src
	has_selected = !has_selected

func get_disabled(src: int) -> Array[int]:
	var lst: Array[int] =  []
	if (src in souls):
		lst = stock.duplicate()
	elif (src in stock):
		lst = stock.duplicate()
		lst.erase(src)
	return lst

# Swapping
func swap(src: int, tar: int):
	var tem: SoulData = slots[src].soul
	slots[src].soul = slots[tar].soul
	slots[tar].soul = tem

# Applying

