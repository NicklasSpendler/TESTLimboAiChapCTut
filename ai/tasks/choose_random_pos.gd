extends BTAction

var pos: Vector3;
var cur_agent: bird

func _enter() -> void:
	cur_agent = agent as bird;
	var pos: Vector3 = cur_agent.global_position;
	pos += Vector3(
		randf_range(-1.0, 1.0),
		0,
		randf_range(-1.0, 1.0)
	)
	blackboard.set_var("pos", pos)
	

func _tick(delta: float) -> Status:
	
	if(pos != cur_agent.global_position):
		return SUCCESS;
	
	if(pos == cur_agent.global_position):
		return FAILURE;
	
	return RUNNING;
