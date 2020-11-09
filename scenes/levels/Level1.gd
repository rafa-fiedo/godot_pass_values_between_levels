extends Node2D

# door name
var run_from_from_doo_position = null 

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.last_door_name:
		var door_node = find_node(Global.last_door_name)
		if door_node:
			$Player.global_position = door_node.global_position
		
	# to prevert bugs
	Global.last_door_name = null
