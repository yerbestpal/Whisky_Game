extends Node

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_StartButton_pressed() -> void:
	print("success")
	$TransitionPlayer.play("fade_out")


func _on_TransitionPlayer_animation_finished(anim_name: String) -> void:
	print("success")
	var game_room = preload("res://Scenes/Game.tscn")
	get_tree().change_scene_to_packed(game_room)
