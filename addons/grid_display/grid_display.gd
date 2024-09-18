@tool
class_name GridDisplay

extends Node2D


##The Number of cells, horizontally and vertically, using x/y values respectively
@export var grid_size := Vector2(2, 5):
	set(value):
		grid_size = value
		queue_redraw()
##The line size of the grid, horizontally and vertically, using x/y values respectively
@export var line_size := Vector2(5.0, 5.0):
	set(value):
		line_size = value
		queue_redraw()

@export var border_width := 5.0:
	set(value):
		border_width = value
		queue_redraw()

@export var cell_size := Vector2(64.0, 64.0):
	set(value):
		cell_size = value
		queue_redraw()

@export_category("Colors")
##Horizontal Line Color
@export var border_color := Color.WHITE:
	set(value):
		border_color = value
		queue_redraw()
##Vertical Line Color
@export var vline_color := Color.WHITE:
	set(value):
		vline_color = value
		queue_redraw()

##Horizontal Line Color
@export var hline_color := Color.WHITE:
	set(value):
		hline_color = value
		queue_redraw()

@export_category("Display Options")
@export var draw_border := true:
	set(value):
		draw_border = value
		queue_redraw()

@export var draw_grid := true:
	set(value):
		draw_grid = value
		queue_redraw()

func _draw() -> void:
	if draw_border: _draw_rect()
	if draw_grid: _draw_grid()

func _draw_rect():
	var rect = Rect2(0, 0, grid_size.x * cell_size.x, grid_size.y * cell_size.y)
	draw_rect(rect, border_color, false, border_width, false)


func _draw_grid():
	var hline_count = (grid_size.x)
	for i in range(1, hline_count):
		var pos = Vector2(i * cell_size.x, 0)
		var h_pos = Vector2(i * cell_size.x, grid_size.y * cell_size.y)
		draw_line(pos, h_pos, hline_color, line_size.x, false)
	var vline_count = (grid_size.y)
	for i in range(1, vline_count):
		var pos = Vector2(0, i * cell_size.x)
		var v_pos = Vector2(grid_size.x * cell_size.y, i * cell_size.y)
		draw_line(pos, v_pos, vline_color, line_size.y, false)
