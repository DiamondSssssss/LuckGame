extends Label

@onready var boss_bar: ProgressBar = $"../mauanhdam"
var bossDamage: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	# Connect the value_changed signal of boss_bar to _on_boss_bar_value_changed function

# Function called when boss_bar's value changes
func _on_mauanhdam_value_changed(value):
	
	# Calculate the damage received by the boss
	var damageTaken = bossDamage - value
	bossDamage = value
	
	# Check if the boss is taking damage
	if damageTaken > 0:
		modulate = Color(1.0, 0.0, 0.0)
		text = "Boss took\n " + str(damageTaken) + " damage"
	elif damageTaken < 0 and boss_bar.value<1000:
		modulate = Color(0.0, 1.0, 0.0)
		text = "Boss healed\n" + str(damageTaken) + "health"
	
	


