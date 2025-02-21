extends CollisionShape2D

var start_size=Vector2(0.1,0.1)
var end_size=Vector2(5,5)
var duration=10
var fraction=0
var current_size

@export var speed=500

func _ready():
	scale= start_size
	current_size=start_size
func _physics_process(delta):
	fraction=clamp(fraction + delta/duration,0,1)
	
	position += transform.x * speed * delta

	current_size	=lerp(current_size, end_size, fraction)
	scale=current_size
	
func _on_lifetime_timeout():
	queue_free()
