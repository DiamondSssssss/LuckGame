extends Area2D

var start_size=Vector2(1,1)
var end_size=Vector2(10,10)
var duration=10
var fraction=0
var current_size
var delay = 3
var elapsed_time = 0
@export var speed=500

func _ready():
	scale= start_size
func _physics_process(delta):
	elapsed_time += delta
	
	# Kiểm tra xem đã đủ thời gian chờ hay chưa
	if elapsed_time >= delay:
		# Tính toán fraction dựa trên thời gian đã trôi qua kể từ khi bắt đầu di chuyển
		fraction = clamp((elapsed_time - delay) / duration, 0, 1)
		
		# Tính toán giá trị scale dựa trên start_size, end_size và fraction
		var new_scale = lerp(start_size, end_size, fraction)
		position += transform.x.normalized() * speed * delta
		scale=new_scale
	
func _on_timer_timeout():
	queue_free()
