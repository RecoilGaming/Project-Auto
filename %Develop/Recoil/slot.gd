extends Area3D

## FIELDS
@onready var sprite: Sprite3D = $Sprite
@onready var collider: CollisionShape3D = $Collider
@onready var soul: Area3D = $Soul

@export var data: SoulData:
	set(new_data):
		if data == new_data:
			return
			
		if !new_data:
			data = SoulData.new()
		else:
			data = new_data
		
		if is_node_ready():
			_update()

## METHODS
func _ready() -> void:
	_update()

func _update() -> void:
	soul.data = data
