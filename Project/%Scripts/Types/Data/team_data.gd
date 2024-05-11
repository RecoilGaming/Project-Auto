extends Resource
class_name TeamData

## TYPES
enum TeamType {
	TRAINING,
	EXPLORATION,
	ARENA
}

## FIELDS
@export_group("General")
@export var name: String
@export var type: TeamType

@export_group("Stats")
@export var health: int
@export var trophies: int

@export_group("Contents")
@export var idol: IdolData = null
@export var souls: Array[SoulData] = [null, null, null, null, null]
@export var charms: Array[CharmData] = [null, null, null, null, null]

## METHODS
