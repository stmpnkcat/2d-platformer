extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#func show_level(curr_level, levels):
	#for level in range(levels):
		#var child = get_children()[level]
		#var tileMap = child.get_child(0)
		#var door1 = child.get_child(1)
		#var door2 = child.get_child(2)
		#if curr_level - 1 == level:
			#child.visible = true
			#tileMap.set_layer_enabled(1, true)
			#tileMap.set_layer_enabled(2, true)
		#else:
			#child.visible = false
			#door1.set_process(false)
			#door2.set_process(false)
			#tileMap.set_layer_enabled(1, false)
			#tileMap.set_layer_enabled(2, false)
			#
