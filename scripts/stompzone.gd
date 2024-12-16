extends Area2D

@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"
@onready var slime: Node2D = $".."
@onready var player: CharacterBody2D = %Player

func kill(body: Node2D) -> void:
	#kz_colshape.disabled = true
	print("get stomped.")
	body.bounce()
	animation_player.play("death")
	slime.is_dead = true
	await animation_player.animation_finished
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	kill(body) # Replace with function body.
