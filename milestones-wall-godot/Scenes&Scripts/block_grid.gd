extends GridContainer

class_name BlockGrid

@export var rows : int = 6
var blocks : Array

var blocks_by_position : Dictionary[Vector2i, BlockData]

signal block_clicked

func _ready() -> void:
	blocks = get_children()
	assign_block_ids()
	
func assign_block_ids():
	var x_pos = 0
	var y_pos = 0
	for i in range(blocks.size()):
		var pos = Vector2i(x_pos, y_pos)
		blocks[i].button_up.connect(_on_block_pressed.bind(pos))
		blocks[i].block_id = pos
		blocks_by_position[pos] = blocks[i]
		x_pos += 1
		if x_pos == columns:
			x_pos = 0
			y_pos += 1
		pos = Vector2i(x_pos, y_pos)

func _on_block_pressed(pos : Vector2i) -> void:
	print(pos)
	block_clicked.emit(pos)
	
