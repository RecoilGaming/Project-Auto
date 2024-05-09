extends Resource
class_name Statset

## FEILDS
@export var stat1: int = 0
@export var stat2: int = 0

# Constructors
func _init(_stat1: int = 0, _stat2: int = 0) -> void:
	stat1 = _stat1
	stat2 = _stat2

## METHODS
func add_stats(_stat1: int, _stat2: int) -> void:
	stat1 += _stat1
	stat2 += _stat2

func set_stats(_stat1: int, _stat2: int) -> void:
	stat1 = _stat1
	stat2 = _stat2
