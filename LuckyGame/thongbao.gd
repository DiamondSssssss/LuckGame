extends Label
@onready var player_health: ProgressBar = $"../Control/playerhealth"
@onready var boss_bar: ProgressBar = $Control/mauanhdam
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_boss_bar_value_changed(value):
	# Check if the boss_bar's value increased (healing)
	if value > boss_bar.value:
		text = "Boss is healing"
	else:
		text = "Boss is taking damage"
