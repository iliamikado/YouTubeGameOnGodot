extends KinematicBody2D

const SPEED = 10000

onready var ui = get_viewport().get_node("Root/UI/Control")

var window_size
var items = 0
var inventory = {}

func pick(item):
	items += 1
	
	var item_name = item.get_name()
	if item_name in inventory.keys():
		inventory[item_name] += 1
	else:
		inventory[item_name] = 1

func _ready():
	window_size = get_viewport().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var motion = Vector2.ZERO
	
	if Input.is_action_pressed("Down"):
		motion.y += 1
	if Input.is_action_pressed("Up"):
		motion.y += -1
	if Input.is_action_pressed("Right"):
		motion.x += 1
	if Input.is_action_pressed("Left"):
		motion.x += -1
	
	motion = motion.normalized()
	move_and_slide(motion * SPEED * delta)


func _unhandled_input(event):
	if event.is_action_pressed("inventory"):
		ui.toggle_inventory(inventory)
