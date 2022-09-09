extends Label

var flipped: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
#	rect_pivot_offset = rect_size / 2
#	$TextureRect.rect_pivot_offset = $TextureRect.rect_size / 2
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if flipped:
		modulate = Color( 0.745098, 0.745098, 0.745098, 0.8 )
		text = ''
