extends BTAction

var cur_agent: bird
var desired_pos: Vector3
var collided_a_bird: bool

func _enter() -> void:
	cur_agent = agent;
	desired_pos = blackboard.get_var("pos")
	cur_agent.hitbox.connect("body_entered", collidedBird)
	collided_a_bird = false;

func _tick(delta: float) -> Status:
	var direction = cur_agent.global_position.direction_to(desired_pos)
	cur_agent.velocity = direction * cur_agent.speed * delta
	
	if cur_agent.global_position.distance_to(desired_pos) < 0.1:
		cur_agent.hitbox.disconnect("body_entered", collidedBird)
		cur_agent.velocity = Vector3.ZERO
		return SUCCESS
	
	if  collided_a_bird == true:
		cur_agent.hitbox.disconnect("body_entered", collidedBird)
		cur_agent.velocity = Vector3.ZERO
		return SUCCESS
	
	if blackboard.get_var("pos") == null:
		return FAILURE

	return RUNNING

func collidedBird(body: Node3D) -> void:
	if body != cur_agent:
		collided_a_bird = true;
