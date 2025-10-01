extends Node3D

@export var point_a: Vector3
@export var point_b: Vector3
@export var speed := 1.5

var going_to_b := true

func _ready():
	position = point_a

func _process(delta):
	if going_to_b:
		position = position.move_toward(point_b, speed * delta)
		if position.distance_to(point_b) < 0.05:
			going_to_b = false
	else:
		position = position.move_toward(point_a, speed * delta)
		if position.distance_to(point_a) < 0.05:
			going_to_b = true
