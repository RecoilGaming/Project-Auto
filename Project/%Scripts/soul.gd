extends Area3D

## FIELDS
@onready var sprite: Sprite3D = $Sprite
@onready var collider: CollisionShape3D = $Collider
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
# Signals
func _on_mouse_entered():
	pass

# Base
func _ready() -> void:
	_update()

func _update() -> void:
	if data:
		sprite.texture = data.sprite

# Enable
func enable() -> void:
	sprite.visible = 1
	collider.disabled = 0

func disable() -> void:
	sprite.visible = 0
	collider.disabled = 1
