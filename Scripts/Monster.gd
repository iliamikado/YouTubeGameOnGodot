extends KinematicBody2D

var speed = 1000

var stands = true
var destination = Vector2()
var velocity = Vector2()



func _ready():
	pass # Replace with function body.

func set_destination(dest):
	destination = dest
	velocity = (destination - position).normalized()
	stands = false

func _process(delta):
	set_destination(get_parent().get_parent().get_player().position)
	
	move_and_slide(velocity * speed * delta)
		
	
