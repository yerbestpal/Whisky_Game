class_name ActiveParticipant
extends Node

onready var global_vars = get_node('/root/GlobalVariables')
var participant_name: String = ''
var hand: Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Create hand.
	for card in range(1, int(global_vars.starting_hand_size + 1)):
		hand['card' + str(card)] = {
			'card': card,
			'flipped': false
		}
	print(hand)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
