extends CanvasLayer

func _on_player_health_updated(health) -> void:
	$Health.text = str(health) + "%"
