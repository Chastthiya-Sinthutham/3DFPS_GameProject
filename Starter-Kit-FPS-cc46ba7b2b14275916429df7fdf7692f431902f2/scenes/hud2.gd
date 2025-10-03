extends CanvasLayer

func _process(delta):
	$score.text = "Score: %d" % GlobalScore.score

func _on_player_health_updated(health) -> void:
	$Health.text = str(health) + "%"
