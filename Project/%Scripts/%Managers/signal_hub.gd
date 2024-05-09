extends Node

## METHODS
# Setup
func _ready() -> void:
	for event in Constants.Event:
		add_user_signal(event, [{"name": "src", "type": TYPE_INT}])

# Utility
func get_event_name(event: Constants.Event) -> String:
	return Constants.Event.keys()[event].to_lower()
