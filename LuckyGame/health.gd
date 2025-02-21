extends ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready():
	# Connect the signal to update the appearance when the value changes"
	# Initial appearance setup
	update_appearance()

# Called when the ProgressBar's value changes
func _on_value_changed(value):
	update_appearance()

# Update the appearance based on the ProgressBar's value
func update_appearance():
	var sb = StyleBoxFlat.new()
	add_theme_stylebox_override("fill", sb)

	if value < 30:
		sb.bg_color = Color(1, 0, 0)  # Red color for value < 30
	elif value >= 30 and value < 70:
		sb.bg_color = Color(1, 0.85, 0)  # Yellow color for 30 <= value < 70
	elif value >= 70:
		sb.bg_color = Color(0.51, 0.98, 0)  # Green color for value >= 70
