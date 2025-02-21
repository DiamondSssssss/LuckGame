extends CharacterBody2D
@export var speed: float =200
@export var accel: float = 10
@export var dash_speed=700
@export var rotation_speed=1
@onready var anim= get_node("player")
@onready var progress_bar: ProgressBar = $ProgressBar/ProgressBar
@onready var player_health: ProgressBar = $"../Control/playerhealth"
var dash_direction= Vector2()
var can_dash=true
var shotguncanShoot=true
var gunnum=-1
var index=0
var mousePos=Vector2()
var player: Node2D
var weapon: Array=[preload("res://plasmasurge.tscn"), preload("res://bulletssss.tscn"), preload("res://threewayshot.tscn")
, preload("res://chargesh.tscn"), preload("res://laserbeam.tscn"), preload("res://bouncyshot.tscn")]


var current_weapon_index=0
var current_weapon= weapon[current_weapon_index]
# Called when the node enters the scene tree for the first time.
func _ready():
	current_weapon=weapon[current_weapon_index]
func _physics_process(_delta: float) -> void:
	var playerPos= global_position
	var direction: Vector2 = Input.get_vector("left","right","up","down")
	velocity.x= move_toward(velocity.x, speed*direction.x, accel)
	velocity.y= move_toward(velocity.y, speed*direction.y, accel)
	
	
	if direction == Vector2(-1,0) || direction==Vector2(0,1):
		get_node("player").flip_h=true
		anim.play("run")
	elif direction==Vector2(1,0) ||  direction==Vector2(0,-1):
		get_node("player").flip_h=false
		anim.play("run")
		
	if Input.is_action_just_pressed("dash") and can_dash:
		can_dash=false
		dash_direction=direction.normalized()
		velocity= dash_direction* dash_speed
		$dashcd.start()
		
#	if Input.is_action_pressed("switch_weapon"):
#		if gunnum<=4 && gunnum!=0:
#			gunnum=gunnum-1
#		if gunnum==0:
#			gunnum=4	
		
	if  Input.is_action_pressed("shoot") and index==2:
		var knockback_direction = (mousePos - position).normalized()
		velocity = -knockback_direction * 200
	if  Input.is_action_pressed("ultimate") and progress_bar.value==100:
		var knockback_direction = (mousePos - position).normalized()
		velocity = -knockback_direction * 1000
	elif Input.is_action_pressed("shoot") and index==4:
		velocity *= 0.7
	
	move_and_slide()



func _process(delta: float) -> void:
	mousePos= get_global_mouse_position()
	var targetDir= get_angle_to(mousePos- position.normalized())
	rotation+=sin(targetDir*rotation_speed)
	
	if Input.is_action_just_pressed("switch_weapon"):
		
		switchweapon(gunnum)
	if player_health.value==0:
		queue_free()
func switchweapon(gunnum):
	current_weapon_index+=gunnum
	if current_weapon_index>weapon.size()-1:
		current_weapon_index=0
	if current_weapon_index<0:
		current_weapon_index=weapon.size()-1
	current_weapon=weapon[current_weapon_index]
	index= current_weapon_index
	
	move_and_slide()
	
	



func _on_dashcd_timeout():
	can_dash=true






