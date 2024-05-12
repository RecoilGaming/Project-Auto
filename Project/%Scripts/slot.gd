extends Area2D

## FIELDS
@onready var base: Sprite2D = $Base
@onready var sprite: Sprite2D = $Sprite
@onready var collider: CollisionShape2D = $Collider
@export var mutable: bool = 1
@export var id: int = 0
@export var soul: SoulData:
	set(_soul):
		soul = _soul
		
		if is_node_ready():
			_update()

var highlighted: bool = 0
var disabled: bool = 0

## METHODS
# Signals
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event is InputEventMouseButton):
		if (mutable and !disabled and Input.is_action_just_pressed("left_click")):
			SignalHub.select_soul.emit(id)

func _on_mouse_entered():
	if (!disabled and !highlighted):
		highlight()

func _on_mouse_exited():
	if (!disabled and !highlighted):
		unhighlight()

# Base
func _ready() -> void:
	_update()

func _update() -> void:
	if (soul):
		sprite.texture = soul.type.sprite
	else:
		sprite.texture = null

# Disable
func enable(show: bool = 1) -> void:
	disabled = 0
	if (show): base.modulate.a = 0.5

func disable(show: bool = 1) -> void:
	disabled = 1
	if (show): base.modulate.a = 0.25

# Highlight
func highlight(force: bool = 0) -> void:
	base.modulate.a = 1
	if (force): highlighted = 1

func unhighlight(force: bool = 0) -> void:
	base.modulate.a = 0.5
	if (force): highlighted = 0

