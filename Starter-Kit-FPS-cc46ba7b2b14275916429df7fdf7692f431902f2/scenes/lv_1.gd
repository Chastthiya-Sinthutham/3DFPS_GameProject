extends Node3D

@onready var hit_rect = $RedFlash/damaged
@onready var heal_effect = $RedFlash/heal

func _ready() -> void:
	$music/PixelRush8BitChiptuneBackgroundMusic410043.play()

func _on_player_player_hit() -> void:
	hit_rect.visible = true
	await get_tree().create_timer(0.2).timeout
	hit_rect.visible = false



func _on_player_heal_effect() -> void:
	heal_effect.visible = true
	await get_tree().create_timer(0.3).timeout
	heal_effect.visible = false
