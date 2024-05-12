extends Resource
class_name SoulData

## FIELDS
@export_group("General")
@export var type: SoulType
@export var charm: CharmData

@export_group("Shop") # Buy, Sell
@export var price_changes: Statset = Statset.new()

@export_group("Levels")
@export var level: int = 1
@export var xp: int = 0

@export_group("Stats") # Atk, Hp
@export var stat_changes: Statset = Statset.new() # Permanent
@export var stat_modifier: Statset = Statset.new() # Temporary

var is_dead: bool = false
var is_infused: bool = false
var is_max_level: bool = false

## METHODS
# Damage
func damage(amt: int) -> void:
	stat_modifier.add_stats(0, -amt)
	if type.health + stat_modifier.stat2 <= 0:
		die()

func die() -> void:
	is_dead = true

# Healing / reviving
func heal(amt: int) -> void:
	stat_modifier.add_stats(0, amt)

func revive() -> void:
	is_dead = false
	refresh()

# Leveling
func add_all_xp(amt: int) -> void:
	while (!is_max_level and amt):
		add_xp()
		amt -= 1

func add_xp() -> void:
	xp += 1
	price_changes.stat1 += 3
	if (xp > type.xp_required[level]):
		levelup()

func levelup() -> void:
	level += 1
	price_changes.stat2 += 1
	xp = 0
	if (level == type.max_level):
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

# Reset
func refresh() -> void:
	stat_modifier.set_stats(0, 0)
	is_infused = false

func reset() -> void:
	stat_changes.set_stats(0, 0)

# Export
func export_data(file: FileAccess) -> void:
	pass
