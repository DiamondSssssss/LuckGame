extends CharacterBody2D
@export var speed=500
func _ready():
	# Calculate the direction vector based on the character's rotation
	var angle = rad_to_deg(rotation)
	var direction = Vector2(cos(deg_to_rad(angle)), sin(deg_to_rad(angle)))
	
	# Set the initial velocity in the direction the character is facing
	set_velocity(direction * 250) # Adjust the speed as needed
func _physics_process(delta):
	position += transform.x.normalized() * speed * delta
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.get_normal())



func _on_timer_timeout():
	queue_free()
