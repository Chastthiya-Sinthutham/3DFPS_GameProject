extends Node3D

@export var heal_amount := 20  # กำหนดค่าฮีลที่ Inspector

func _on_body_entered(body):
	if body.has_method("heal"):
		body.heal(heal_amount)
		queue_free()   # ทำลายไอเทมหลังเก็บ
