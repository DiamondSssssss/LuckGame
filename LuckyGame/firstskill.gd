extends Node

const NUM_OBJECTS = 6  # Number of objects you want to spawn

@onready var object_template = preload("res://bossrocket.tscn") 

var your_min_x_position : int = 100  # Set your desired minimum X position
var your_max_x_position : int = 500  # Set your desired maximum X position
var your_min_y_position : int = 200  # Set your desired minimum Y position
var your_max_y_position : int = 600  # Set your desired maximum Y position

func _ready():
	spawn_objects()

func spawn_objects():
	for i in range(NUM_OBJECTS):
		var instance = object_template.instantiate()  # Create a new instance of the object
		var random_x = randi_range(your_min_x_position, your_max_x_position)
		var random_y = randi_range(your_min_y_position, your_max_y_position)
		instance.position = Vector2(random_x, random_y)
		add_child(instance)  # Add the instance as a child of the spawner node
