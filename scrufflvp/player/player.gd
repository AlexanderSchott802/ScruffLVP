extends Area2D
signal hit

@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
var velocity = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	screen_size.x -= $playerHitBox.shape.size.x
	screen_size.y -= $playerHitBox.shape.size.y
	print(screen_size)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void: # The player's movement vector.
	#var velocity = Vector2.ZERO # players acceleration vector
	var moveAcc = 800
	var maxSpeed = 800
	#
	if Input.is_action_pressed("move_right"):
		velocity.x += moveAcc
	if Input.is_action_pressed("move_left"):
		velocity.x -= moveAcc
	if Input.is_action_pressed("move_down"):
		velocity.y += moveAcc
	if Input.is_action_pressed("move_up"):
		velocity.y -= moveAcc
	
	
	velocity = velocity/1.7
	
	if velocity.x >= maxSpeed:
		velocity.x = maxSpeed
	if velocity.x <= -maxSpeed:
		velocity.x = -maxSpeed
	if velocity.y >= maxSpeed:
		velocity.y = maxSpeed
	if velocity.y <= -maxSpeed:
		velocity.y = -maxSpeed
	
	var magnitude = velocity.length()
	
	velocity = velocity.normalized()
	velocity *= magnitude
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
