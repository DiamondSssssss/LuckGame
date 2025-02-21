extends Node2D
var weapon: Array=[preload("res://plasmasurge.tscn"), preload("res://bulletssss.tscn"), preload("res://threewayshot.tscn")
, preload("res://chargesh.tscn"), preload("res://laserbeam.tscn"), preload("res://bouncyshot.tscn")]
var index=0
var current_weapon_index=0
var current_weapon= weapon[current_weapon_index]
@onready var progress_bar: ProgressBar = $"../ProgressBar/ProgressBar"
# Called when the node enters the scene tree for the first time.
func _ready():
	current_weapon=weapon[current_weapon_index]
var canShoot= true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if canShoot and Input.is_action_pressed("shoot"):
		shoot()
		canShoot=false
		$"../cooldown_timer".start()
		
	if canShoot and Input.is_action_pressed("shoot") and index==2:
		shoot()
		canShoot=false
	if Input.is_action_pressed("shoot") and index==4:
		shoot()

	if Input.is_action_just_pressed("switch_weapon"):
		var direction=-1
		switchweapon(direction)
	if Input.is_action_just_pressed("ultimate") and progress_bar.value==100:
		ultimateShoot()
		progress_bar.value=0

func switchweapon(direction):
	current_weapon_index+=direction
	if current_weapon_index>weapon.size()-1:
		current_weapon_index=0
	if current_weapon_index<0:
		current_weapon_index=weapon.size()-1
	current_weapon=weapon[current_weapon_index]
	index= current_weapon_index
func shoot():
	var p=current_weapon.instantiate()
	owner.add_child(p)
	p.transform= $"../gun_off_set".global_transform

func ultimateShoot():
	var ultimateBullet = preload("res://ultimate.tscn").instantiate()
	owner.add_child(ultimateBullet)
	ultimateBullet.transform = $"../gun_off_set".global_transform
func _on_cooldown_timer_timeout():
	canShoot=true




func _on_ultimatecd_timeout():
	if progress_bar.value<100:
		progress_bar.value= progress_bar.value +1

