extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Control/CanvasLayer/Label2.text = str(scorescore.score1)
	
	




func _on_Button_pressed():
	get_tree().change_scene("Game.tscn")
	pass # Replace with function body.


func _on_buttonexit_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_about_pressed():
	get_tree().change_scene("about.tscn")
	pass # Replace with function body.
