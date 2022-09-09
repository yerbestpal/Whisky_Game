class_name Game
extends Node2D

onready var dicebag = preload('res://dicebag-godot/Dicebag.gd').new()
onready var global_vars = get_node('/root/GlobalVariables')
#var player_hand: Dictionary = {}
#var bot1_hand: Dictionary = {}
#var bot2_hand: Dictionary = {}
#var bot3_hand: Dictionary = {}
var participant_node
var hand_node

onready var ActivePlayerHands: Dictionary = {
	global_vars.ActivePlayer.PLAYER: {},
	global_vars.ActivePlayer.BOT1: {},
	global_vars.ActivePlayer.BOT2: {},
	global_vars.ActivePlayer.BOT3: {}
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	participant_node = get_child(7)
	hand_node = participant_node.get_child(0)

	# Hide dice on game start
	$Dice1.visible = false
	$Dice2.visible = false

	for hand in range(0, ActivePlayerHands.size() - 1):
		for card in range(1, int(global_vars.starting_hand_size + 1)):
			ActivePlayerHands[hand]['card' + str(card)] = {
				'card': card,
				'flipped': false
			}

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func _on_RollButton_pressed() -> void:
	$RollButton.visible = false
	$RollButton.disabled = true
	dicebag.set_up_rng()
	var dice1 = dicebag.roll_custom_dice(
		[[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6]]
	)
	var dice2 = dicebag.roll_custom_dice(
		[[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6]]
	)

	# `roll_custom_dice(...)` sometimes returns 0 but never 1. Correct this to set the dice text
	# to 1 if the function returns 0
	var final_dice1: int = 1 if (dice1 == 0) else dice1
	var final_dice2: int = 1 if (dice1 == 0) else dice2
	$Dice1.text = str(final_dice1)
	$Dice2.text = str(final_dice2)

	$Dice1.visible = true
	$Dice2.visible = true

	# Highlight (flip) player cards corresponding to the dice values for flipping.
	for c in participant_node.hand.values():
		if c['card'] == final_dice1 or \
		c['card'] == final_dice2 or \
		c['card'] == (final_dice1 + final_dice2):
			c['flipped'] = true

	for child in hand_node.get_children():
		if child.text == str(final_dice1) or \
		child.text == str(final_dice2) or \
		child.text == str(final_dice1 + final_dice2):
			child.text = ''
			child.flipped = true

	# Enable EndTurnButton.
	$'../../EndTurnButton'.visible = true
	$'../../EndTurnButton'.disabled = false

func _on_Participant_renamed() -> void:
	# Clear hand
	print(str(hand_node))
	for child in hand_node.get_children():
		hand_node.remove_child(child)

	print(get_child(5))
	var divided_x_value = get_viewport_rect().size.x / global_vars.starting_hand_size
	var position_count: float = 0

	# When the participant node is renamed, update the cards to match its hand
	for c in participant_node.hand.values():
		var cardObj = preload('res://Scenes/Card.tscn')
		var card = cardObj.instance()
		print(str(c))
		if !c.flipped: card.text = str(c['card'])
		hand_node.add_child(card)

		# Add the value of viewport X / hand count to that same value stored in each iteration. This
		# positions the cards evenly on the X-axis.
		card.rect_global_position.y = hand_node.global_position.y
		card.rect_global_position.x = position_count
		position_count += divided_x_value
		print(str(position_count))
		print(str(card))
