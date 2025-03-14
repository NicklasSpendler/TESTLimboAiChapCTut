extends BTAction

var cur_agent: bird
var desired_pos: Vector3

func _enter() -> void:
	cur_agent = agent;
	desired_pos = blackboard.get_var("pos")

func _tick(delta: float) -> Status:
	var direction = cur_agent.global_position.direction_to(desired_pos)
	cur_agent.velocity = direction * cur_agent.speed * delta
	
	if cur_agent.global_position.distance_to(desired_pos) < 0.1:
		cur_agent.velocity = Vector3.ZERO
		return SUCCESS
	
	if blackboard.get_var("pos") == null:
		return FAILURE

	return RUNNING
