extends Area2D

@export var speed = 500
var velocity = Vector2(1, 0).normalized() * speed

func _physics_process(delta):
	position += velocity * delta

func _on_timer_timeout():
	queue_free()

func _on_Bullet_body_entered(body):
	# Check if the collided body is on the specified physics layer (PhysicsLayer 2)
	if body.is_in_group("walls"):
		# Invert the appropriate component of velocity to make the bullet bounce
		var collision_normal = body.transform.origin - transform.origin
		velocity = velocity.bounce(collision_normal)
