extends Node


var active_player = null
var turn: int = 0
var starting_hand_size: int = 6 # Update this to be decided in game setup.
var hand_node
var player_name: String

enum ActivePlayer {
	PLAYER,
	BOT1,
	BOT2,
	BOT3
}

#var ActivePlayerHands: Dictionary = {
#	ActivePlayer.PLAYER: {},
#	ActivePlayer.BOT1: {},
#	ActivePlayer.BOT2: {},
#	ActivePlayer.BOT3: {}
#}


# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
#	for hand in range(0, ActivePlayerHands.size() - 1):
#		for card in range(1, int(starting_hand_size + 1)):
#			ActivePlayerHands[hand]['card' + str(card)] = {
#				'card': card,
#				'flipped': false
#			}


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
