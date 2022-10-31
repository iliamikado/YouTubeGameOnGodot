extends Node2D


onready var item = preload("res://Scenes/Item.tscn")

func get_player():
	return $Robot

func _ready():
	var items = ["coin", "flask"]
	for i in range(15):
		randomize()
		var a = int(rand_range(0, 2))
		var new_item = item.instance()
		$Items.add_child(new_item)
		new_item.set_item(items[a])
		new_item.position = Vector2(int(rand_range(0, 500)), int(rand_range(0, 500)))

