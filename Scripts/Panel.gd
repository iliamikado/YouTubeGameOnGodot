extends NinePatchRect

onready var item = preload("res://Scenes/InventItem.tscn")
onready var container = $Scroll/Grid

func _ready():
	clear()
	visible = false

func clear():
	for i in container.get_children():
		container.remove_child(i)
		i.queue_free()

func show_inventory(inventory):
	for i in inventory.keys():
		for a in range(inventory[i]):
			var new_item = item.instance()
			new_item.set_item(i)
			container.add_child(new_item)
		
