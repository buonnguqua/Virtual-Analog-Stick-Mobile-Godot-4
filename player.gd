extends CharacterBody2D

@export var speed: int = 200

var myVelocity = Vector2()
var _dir = Vector2(0,0)
var _animplayer

func _ready():
	_animplayer = get_node("AnimationPlayer")
	Play_Scale_Animation()
	
func _physics_process(_delta):
	set_velocity(myVelocity*speed)
	move_and_slide()
	if(_dir != Vector2(0,0)):
		look_at(get_transform().origin+_dir);

func analog_force_change(inForce, inAnalog):
	if(inAnalog=="Left_Analog"):
		myVelocity.x = inForce.x
		myVelocity.y = -inForce.y
	if(inAnalog=="Right_Analog"):
		if(inForce.length() > 0.3):
			_dir = Vector2(inForce.y,inForce.x)

func Play_Scale_Animation():
	_animplayer.play("Anim")
	
func Stop_Scale_Animation():
	_animplayer.play("StopAnim")
