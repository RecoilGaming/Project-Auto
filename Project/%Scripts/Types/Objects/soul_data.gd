extends Resource
class_name SoulData

## FIELDS
@export_group("General")
@export var name: String
@export var sprite: Texture
@export var ability: BaseAbility

@export_group("Shop")
@export var buy_price: int = 3
@export var sell_value: int = 1

@export_group("Levels")
@export var tier: int = 1
@export var level: int = 1
@export var xp: int = 0
@export_subgroup("Optional")
@export var max_level: int = 3
@export var xp_required: Array[int] = [2,3]

@export_group("Stats")
@export var melee: int = 1
@export var ranged: int = 0
@export var health: int = 1
var stat_changes: Statset = Statset.new() # Permanent
var stat_modifier: Statset = Statset.new() # Temporary

var is_dead: bool = false
var is_infused: bool = false
var is_max_level: bool = false

## METHODS
# Damage
func damage(amount: int) -> void:
	stat_modifier.add_stats(0, -amount)
	if health + stat_modifier.stat2 <= 0:
		die()

func die() -> void:
	is_dead = true

# Healing / reviving
func heal(amount: int) -> void:
	stat_modifier.add_stats(0, amount)

func revive() -> void:
	is_dead = false
	refresh()

# Leveling
func add_xp(amount: int) -> void:
	xp += amount
	while (!is_max_level and xp > xp_required[level]):
		levelup(1)

func levelup(amount: int) -> void:
	level += amount
	if (level >= max_level):
		level = max_level
		is_max_level = true

# Infusion
func infuse() -> void:
	is_infused = true
	stat_modifier.add_stats(1, 1)

# Stats
func modify_stats(_attack: int, _health: int) -> void:
	stat_modifier.add_stats(_attack, _health)

func change_stats(_attack: int, _health: int) -> void:
	stat_changes.add_stats(_attack, _health)

# Reset stat changes
func refresh() -> void:
	stat_modifier.set_stats(0, 0)
	is_infused = false

func reset() -> void:
	stat_changes.set_stats(0, 0)
