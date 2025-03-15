class_name bird
extends CharacterBody3D

@onready var sprite_3d: Sprite3D = $Sprite3D
@onready var hitbox: Area3D = $Hitbox

var speed: float = 100;

func _physics_process(delta: float) -> void:

	if not is_on_floor():
		velocity += get_gravity() * delta

	if velocity != Vector3.ZERO:
		if velocity.x > 0:
			sprite_3d.flip_h = false
		else:
			sprite_3d.flip_h = true

	move_and_slide()
