extends Area2D

export(String, FILE, "*.tscn,*.scn") var target_scene

# Packed Scene note:
# - no problem when Level1 have Level2 as Packed Scene
# - the problem appears when Level2 also have a Level1 as packed scene
# endless loop because Level1 have Level2 which have Level 1 which have Level 2 and so on....

# Solution - use Strings

func _ready():
	pass

func _input(event):
	if event.is_action_pressed("ui_accept"):
		if get_overlapping_bodies().size() > 0:
			if !target_scene: # is null
				print("no scene in this door")
				return
			$AnimationPlayer.play("Open")
			get_overlapping_bodies()[0].play_walk_in_animation() # 0 will be our player
			
func next_level():
	var ERR = get_tree().change_scene(target_scene)
	
	if ERR != OK:
		print("something failed in the door scene")
		
	Global.door_name = name
