extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	$AnimPlayer.play()
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED

	
	if Input.is_action_pressed("move_right"):
		velocity.x+=SPEED
		$AnimPlayer.animation="corrida"

	if Input.is_action_pressed("move_left"):
		velocity.x-=SPEED
		$AnimPlayer.animation="corrida"
		
	if Input.is_action_pressed("chute"):
		$AnimPlayer.animation="chute"
		
	if Input.is_action_pressed("voadora"):
		$AnimPlayer.animation="voadora"
		
	if Input.is_action_pressed("soco"):
		$AnimPlayer.animation="soco"
	
	if Input.is_action_pressed("combo"):
		$AnimPlayer.animation="combo"
		
	if Input.is_anything_pressed()==false:
		velocity.x=0
		$AnimPlayer.animation="padrao"
	
	
	
	
	if velocity.x < 0:
		$AnimPlayer.flip_h = true
	else:
		$AnimPlayer.flip_h = false
	move_and_slide()
