extends Area2D

var playerDone = false
var player2Done = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" || body.name == "Player2":
		$AnimationPlayer.play("door_open")
		if body.name == "Player":
			playerDone = true
		if body.name == "Player2":
			player2Done = true
