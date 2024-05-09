extends Resource
class_name BaseAbility

## FIELDS
@export var event: Constants.Event
@export var trigger: Constants.Target

var event_id: String
var position: int = -1
var counter: int = 0

## METHODS
# Setup
func _ready():
	event_id = SignalHub.get_event_name(event)

# Ability
func activate() -> void:
	SignalHub.connect(event_id, ability)

func ability(src: int) -> void:
	print(src)

# Utility
func is_trigger(src: int, tri: Constants.Target = trigger) -> bool:
	match tri:
		Constants.Target.WORLD:
			return src == -1
		Constants.Target.SELF:
			return src == position
		Constants.Target.SPIRIT:
			return src == 0
		Constants.Target.LEADER:
			return src == 1
		Constants.Target.LEFT_SIDE:
			return (src == 3 || src == 5) && src == position + 1
		Constants.Target.RIGHT_SIDE: 
			return (src == 2 || src == 4) && src == position - 1
		Constants.Target.BESIDE: 
			return is_trigger(src, Constants.Target.LEFT_SIDE) || is_trigger(src, Constants.Target.RIGHT_SIDE)
		Constants.Target.ALLY_AHEAD:
			return (src == 2 || src == 3) && src == position - 2
		Constants.Target.ENEMY_AHEAD:
			return (src == 7 || src == 8) && src == position + 5
		Constants.Target.AHEAD:
			return is_trigger(src, Constants.Target.ALLY_AHEAD) || is_trigger(src, Constants.Target.ENEMY_AHEAD)
		Constants.Target.ALLY_BEHIND:
			return (src == 4 || src == 5) && src == position + 2
		Constants.Target.ALLY_INLINE:
			return is_trigger(src, Constants.Target.ALLY_AHEAD) || is_trigger(src, Constants.Target.ALLY_BEHIND)
		Constants.Target.ENEMY_INLINE:
			return is_trigger(src, Constants.Target.ENEMY_AHEAD) || is_trigger(src, Constants.Target.ENEMY_FAR_AHEAD)
		Constants.Target.INLINE:
			return is_trigger(src, Constants.Target.ALLY_INLINE) || is_trigger(src, Constants.Target.ENEMY_INLINE)
		Constants.Target.FRONT_ROW:
			return src == 2 || src == 3
		Constants.Target.BACK_ROW:
			return src == 4 || src == 5
		Constants.Target.ACROSS:
			return (src == 2 && position == 5) || (src == 3 && position == 4) || (src == 4 && position == 3) || (src == 5 && position == 2)
		Constants.Target.ENEMY_ACROSS:
			return (src == 2 && position == 8) || (src == 3 && position == 7)
		Constants.Target.ENEMY_FRONT_ROW:
			return src == 7 || src == 8
		Constants.Target.ENEMY_FAR_AHEAD:
			return ((src == 2 || src == 3) && src == position + 7) || ((src == 4 || src == 5) && src == position + 3)
		Constants.Target.ENEMY_FAR_ACROSS:
			return (src == 9 && (position == 3 || position == 4)) || (src == 10 && (position == 2 || position == 5))
		Constants.Target.ENEMY_BACK_ROW:
			return src == 9 || src == 10
		Constants.Target.ALLY:
			return src >= 1 && src <= 5
		Constants.Target.ENEMY:
			return src >= 6 && src <= 10
		Constants.Target.ANY:
			return src >= 1 && src <= 10
		_:
			return 0

func set_position(_position: int) -> void:
	position = _position

func reset_counter() -> void:
	counter = 0
