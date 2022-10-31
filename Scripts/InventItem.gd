extends TextureRect

func set_item(item_name):
	texture = load("res://Sprites/Items/%s.png" % item_name)
