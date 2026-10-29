extends Control

@export var block_grid : BlockGrid

func _ready() -> void:
	block_grid.block_clicked.connect(_on_blocked_clicked)

func _on_blocked_clicked(pos : Vector2i) -> void:
	color_adjecent_blocks(pos)
	pass

func color_adjecent_blocks(pos) -> void:
	clear_block_background_colors()
	var top_left = pos - Vector2i(1, 1)
	var size_to_display := Vector2i(3, 3)
	for x in range(top_left.x, top_left.x + size_to_display.x):
		for y in range(top_left.y, top_left.y + size_to_display.y):
			if x < 0 or y < 0 or x > block_grid.columns -1 or y > block_grid.rows -1: 
				print("block out of range")
				continue
			var p := Vector2i(x,y)
			if not block_grid.blocks_by_position.has(p): continue
			if block_grid.blocks_by_position[p].is_display_case: continue
			block_grid.blocks_by_position[p].block_background_color.color = Color.BLUE

func clear_block_background_colors() -> void:
	for b in block_grid.blocks:
		if b.is_display_case: continue
		b.block_background_color.color = b.default_color
