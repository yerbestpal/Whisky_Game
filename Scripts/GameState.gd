class_name GameState
extends State

var game: Game

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	game = owner as Game
	# This check will tell us if we inadvertently assign a derived state
	# script in a scene other than `Game.tscn` which would be unintended.
	# This can help prevent some bugs that are difficult to understand.
	assert(game != null)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
