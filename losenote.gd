extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
	$CanvasLayer/NinePatchRect.show_text("losenote" ,"lose")
	





func _on_Button_pressed():
	get_tree().change_scene("StartMenu.tscn")
	pass # Replace with function body.
