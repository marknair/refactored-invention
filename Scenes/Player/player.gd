extends CharacterBody2D

class_name Player

@export var move_speed: float = 100

func _ready() -> void:
	self.position = SceneManager.player_spawn_position

func _physics_process(delta: float) -> void:
	var move_vector: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = move_vector * move_speed
	
	if velocity.x > 0:
		$AnimatedSprite2D.play("move_right")
	
	elif velocity.x < 0:
		$AnimatedSprite2D.play("move_left")
		
	elif velocity.y > 0:
		$AnimatedSprite2D.play("move_down")
		
	elif velocity.y < 0:
		$AnimatedSprite2D.play("move_up")
		
	else:
		$AnimatedSprite2D.stop()
		
	move_and_slide()


func _on_hit_box_area_body_entered(body: Node2D) -> void:
	get_tree().call_deferred("reload_current_scene")
