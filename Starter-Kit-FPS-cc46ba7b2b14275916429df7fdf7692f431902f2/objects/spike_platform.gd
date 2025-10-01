extends Node3D

@export var damage_amount := 35   # กำหนดดาเมจจาก Inspector ได้

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.has_method("damage"):
		body.damage(damage_amount)
