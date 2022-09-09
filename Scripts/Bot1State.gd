# Bot1State.gd
extends GameState

onready var global_vars = get_node('/root/GlobalVariables')

func enter(_msg := {}) -> void:
	global_vars.active_player = str(global_vars.ActivePlayer.BOT1)
	$'../../RollButton'.visible = true
	$'../../RollButton'.disabled = false

	game.participant_node.hand = game.ActivePlayerHands[global_vars.ActivePlayer.BOT1]
	game.participant_node.name = global_vars.active_player
	game.participant_node.participant_name = global_vars.active_player
#	if global_vars.turn != 0: game.participant_node.hand = game.player_hand

#	global_vars.turn += 1

	$'../../ActivePlayerLabel'.text = str("Bot 1")
	$'../../EndTurnButton'.visible = false

func exit() -> void:
	$'../../EndTurnButton'.visible = false
	$'../../EndTurnButton'.disabled = true

# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
#	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_EndTurnButton_pressed() -> void:
	state_machine.transition_to('Bot2State')
