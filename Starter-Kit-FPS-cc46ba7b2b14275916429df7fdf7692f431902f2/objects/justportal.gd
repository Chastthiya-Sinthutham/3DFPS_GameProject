extends Node3D

func _on_area_3d_body_entered(body: Node3D) -> void:
	call_deferred("_change_scene")

func _change_scene():
	get_tree().change_scene_to_file("res://scenes/lv_1.tscn")
