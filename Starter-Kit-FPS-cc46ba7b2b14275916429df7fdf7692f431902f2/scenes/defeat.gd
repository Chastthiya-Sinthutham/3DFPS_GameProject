extends Node2D

func _ready() -> void:
	pass # Replace with function body.

func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")
