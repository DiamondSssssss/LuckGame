extends CharacterBody2D
@onready var boss_bar: ProgressBar = $Control/mauanhdam
@onready var player_health: ProgressBar = $"../Control/playerhealth"
@export var accel: float = 10
var speed: float = 500
var target=null
var damage=1
var ultdam=1
var bossdamage=1
func _ready():
	boss_bar.value= 1000
	player_health.value =100
func _on_area_2d_body_entered(body):
	if body.name == "player":
		bossdamage=randi_range(-5,50)
		print("EM OI LAU DAI TINH AI DO")
		player_health.value= player_health.value- bossdamage
	if body.name=="explode":
		boss_bar.value=boss_bar.value - damage

func _on_area_2d_area_entered(area):
	if area.name== "laser":
		boss_bar.value=boss_bar.value - damage
	if area.name =="motnottram":
		boss_bar.value=boss_bar.value - ultdam
	if area.name=="projectile" || area.name=="projectile2" ||area.name=="projectile3"||area.name=="projectile4"||area.name=="projectile5":
		boss_bar.value=boss_bar.value - damage
	if area.name =="plasma":
		boss_bar.value=boss_bar.value - damage
	if area.name =="bullet":
		boss_bar.value=boss_bar.value - damage
	if area.name =="charge":
		boss_bar.value=boss_bar.value - damage
var rand = randf_range(-1,1)
func _physics_process(delta):
	var direction = Vector2(rand,rand)

	velocity = direction * speed
	if velocity.x<0:
		get_node("anhdam").flip_h=true
	elif velocity.x>0:
		get_node("anhdam").flip_h=false
	if Input.is_action_pressed("switch_weapon"):
		damage= randi_range(-10,10)
		ultdam= randi_range(-100,500)
	move_and_slide()
func _process(delta):
	if boss_bar.value==0:
		queue_free() # Boss is defeated, remove it from the scene


func _on_timer_timeout():
	rand= randf_range(-1,1)
