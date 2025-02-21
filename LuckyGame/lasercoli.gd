extends CollisionShape2D


# Called when the node enters the scene tree for the first time.
@export var speed=500

func _physics_process(delta):
	position += transform.x * speed * delta



func _on_timer_timeout():
	queue_free()
