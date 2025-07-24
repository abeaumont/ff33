extends Node2D

var objects = []
var grid = []

func _ready():
	pass
	
func _process(_delta):
	pass

func add(object):
	objects.append(object)
	
func delete(object):
	for i in range(objects.size()):
		if object == objects[i]:
			objects.remove_at(i)
			break
