@tool
extends EditorPlugin

func _enter_tree() -> void:
	var icon = preload("grid_display.svg")
	var script = preload("res://addons/grid_display/grid_display.gd")
	const base_node = "Node2D"
	const node_name = "Grid Display"
	add_custom_type(node_name, base_node, script, icon)


func _exit_tree() -> void:
	remove_custom_type("Grid Display")
