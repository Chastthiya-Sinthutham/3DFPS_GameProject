extends Node3D

@export var player: Node3D
@export var chase_radius := 12.0   # ระยะที่เริ่มวิ่งเข้าใกล้
@export var move_speed := 3.0      # ความเร็วเดิน
@onready var raycast = $RayCast
@onready var muzzle_a = $MuzzleA
@onready var muzzle_b = $MuzzleB

var health := 100
var time := 0.0
var target_position: Vector3
var destroyed := false

func _ready():
	target_position = position

func _process(delta):
	if destroyed:
		return

	# หมุนหน้าหา player เสมอ
	look_at(player.position + Vector3(0, 0.5, 0), Vector3.UP, true)

	# วัดระยะห่างจาก player
	var dist_to_player = position.distance_to(player.position)

	if dist_to_player < chase_radius:
		# เดินเข้า player (แกน XZ)
		var from = position
		var to = player.position
		to.y = position.y  # ไม่ไต่สูง/ต่ำ
		target_position = from.move_toward(to, move_speed * delta)
	else:
		# เคลื่อนไหวขึ้น-ลงแบบ sine ตามเดิม
		target_position.y += (cos(time * 5.0) * 1.0) * delta

	time += delta
	position = target_position

func damage(amount):
	Audio.play("sounds/enemy_hurt.ogg")
	health -= amount
	if health <= 0 and !destroyed:
		destroy()

func destroy():
	Audio.play("sounds/enemy_destroy.ogg")
	destroyed = true
	queue_free()

func _on_timer_timeout():
	raycast.force_raycast_update()
	if raycast.is_colliding():
		var collider = raycast.get_collider()
		if collider.has_method("damage"):
			muzzle_a.frame = 0
			muzzle_a.play("default")
			muzzle_a.rotation_degrees.z = randf_range(-45, 45)
			muzzle_b.frame = 0
			muzzle_b.play("default")
			muzzle_b.rotation_degrees.z = randf_range(-45, 45)
			Audio.play("sounds/enemy_attack.ogg")
			collider.damage(5)
