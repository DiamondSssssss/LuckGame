extends Area2D
var your_max_x_position = 500
var your_min_x_position = 100
var your_max_y_position = 600
var your_min_y_position = 200
func _ready():
	var random_x = randi() % (your_max_x_position - your_min_x_position) + your_min_x_position
	var random_y = randi() % (your_max_y_position - your_min_y_position) + your_min_y_position
	position = Vector2(1,1)
