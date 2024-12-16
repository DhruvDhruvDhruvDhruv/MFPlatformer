extends Node2D

const SPEED = 50
var direction = 1
var is_dead = false
@onready var raycast_right: RayCast2D = $RaycastRight
@onready var raycast_left: RayCast2D = $RaycastLeft
@onready var raycast_right_floor: RayCast2D = $RaycastRightFloor
@onready var raycast_left_floor: RayCast2D = $RaycastLeftFloor
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_dead:
		direction = 0
	elif raycast_left.is_colliding() or not raycast_left_floor.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false
	elif raycast_right.is_colliding() or not raycast_right_floor.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
	position.x += direction * SPEED * delta
