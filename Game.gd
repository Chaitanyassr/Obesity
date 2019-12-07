extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_tree().paused = true
	$paused/CanvasLayer/Button2.show()
	$paused/CanvasLayer/Button3.show()
	$paused/CanvasModulate.show()
	
	pass # Replace with function body.


func _on_Button2_pressed():
	get_tree().paused = false
	$paused/CanvasModulate.hide()
	$paused/CanvasLayer/Button2.hide()
	$paused/CanvasLayer/Button3.hide()
#
	pass # Replace with function body.


func _on_Button3_pressed():
	get_tree().paused = false
	get_tree().change_scene("StartMenu.tscn")
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	if body.get_name() == get_name():
		get_tree().change_scene("youwon.tscn")





