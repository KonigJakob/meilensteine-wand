extends TextureButton

class_name BlockData

@export var is_display_case : bool = false

@export var block_id : Vector2i = Vector2i(-1, -1)
@export var block_year : String = "XXXX"
@export var block_name : String = "Game Title"
@export var default_color : Color = Color.WHITE

@onready var block_background_color : ColorRect = $Block_Background
@onready var block_texture : TextureRect = $Block_Texture
@onready var year_label : Label = $Block_Year
@onready var block_title_label : Label = $Block_Title

func _ready() -> void:
	set_up()
	
func set_up() -> void:
	if is_display_case: 
		block_background_color.color = Color.GREEN_YELLOW
		return
	else:
		block_background_color.color = default_color
	
	if block_year != "" and block_name != "":
		year_label.text = block_year
		block_title_label.text = block_name
	else:
		print("Check the lables of Block " + str(block_id))
		return
		


func _on_focus_entered() -> void:
	pass # Replace with function body.


func _on_focus_exited() -> void:
	pass # Replace with function body.


func _on_button_up() -> void:
	pass # Replace with function body.
