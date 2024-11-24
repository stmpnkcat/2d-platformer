extends Node2D
signal death1
signal death2

func _ready():
	pass

func _process(delta):
	$Path2D/PathFollow2D.progress += 100 * delta


func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body.name)
	if body.name == "Player":
		death1.emit()
	if body.name == "Player2":
		death2.emit()
