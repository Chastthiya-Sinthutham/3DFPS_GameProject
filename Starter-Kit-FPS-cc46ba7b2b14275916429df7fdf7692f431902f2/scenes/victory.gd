extends Node2D

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$Node/ChampionsVictoryWinnerMusic333682.play()

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")
