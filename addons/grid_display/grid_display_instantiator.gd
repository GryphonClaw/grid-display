@tool
extends Node2D

var scene

func _enter_tree():
	scene = preload("res://addons/grid_display/grid_display_scene.tscn").instantiate()
	add_child(scene)

func _exit_tree():
	scene.free()
