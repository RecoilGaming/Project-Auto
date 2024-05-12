extends Resource
class_name SoulType

enum Faction {
	NONE
}

## FIELDS
@export_group("General")
@export var name: String
@export var tier: int = 1
@export var faction: Faction
@export var sprite: Texture
@export var ability: AbilityData

@export_group("Shop")
@export var buy_price: int = 3
@export var sell_value: int = 1

@export_group("Levels")
@export var max_level: int = 3
@export var xp_required: Array[int] = [2,3]

@export_group("Stats")
@export var melee: int = 1
@export var ranged: int = 0
@export var health: int = 1

@export_group("Max Stats")
@export var max_attack: int = 100
@export var max_health: int = 100
