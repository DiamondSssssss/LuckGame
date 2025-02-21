extends Node2D


@onready var object_template = preload("res://bossrocket.tscn")
@onready var warning_template = preload("res://warning.tscn")  # Path to your warning picture scene

var your_min_x_position : int = 100  # Set your desired minimum X position
var your_max_x_position : int = 500  # Set your desired maximum X position
var your_min_y_position : int = 200  # Set your desired minimum Y position
var your_max_y_position : int = 600  # Set your desired maximum Y position

func _ready():
	pass

func _on_warningtime_timeout():
	print("warning")
	var warning_instance = warning_template.instantiate()
	var random_x = randi_range(your_min_x_position, your_max_x_position)
	var random_y = randi_range(your_min_y_position, your_max_y_position)
	warning_instance.position = Vector2(1,1)
	add_child(warning_instance)

func _on_rocketspawntime_timeout():
	print("BOOM")
	var rocket_instance = object_template.instantiate()
	rocket_instance.position = Vector2(1,1)  # Set the rocket position to the warning position
	add_child(rocket_instance)

func _on_deleteold_timeout():
	queue_free()







