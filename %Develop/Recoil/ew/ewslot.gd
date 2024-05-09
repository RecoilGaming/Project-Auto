extends Area3D

## FIELDS
# OBJECTS
@onready var sprite: Sprite3D = $Sprite
@onready var collider: CollisionShape3D = $Collider
@export var object: Node3D
#@export var data: Summon

# TWEENING
var tween: Tween

## METHODS
# MOUSE DETECTION
func _mouse_enter() -> void:
	tween = create_tween().set_trans(Tween.TRANS_CUBIC)
	await tween.tween_property(sprite, "modulate:a", 1, 0.1).finished

func _mouse_exit() -> void:
	tween = create_tween().set_trans(Tween.TRANS_CUBIC)
	await tween.tween_property(sprite, "modulate:a", 0.5, 0.1).finished

func _input_event(camera: Camera3D, event: InputEvent, position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event.is_action_pressed("ui_left_mouse_click"):
		print("NIG")

# MANAGE OBJECTS
func set_object(_object: Node3D) -> void:
	remove_child(object)
	object = _object
	add_child(object)
	if object:
		object.position = Vector3(0, 0.49, 0)

func get_object() -> Node3D:
	return object
