extends Node

@onready var back_button = $CanvasLayer/Control/MarginContainer/PanelContainer/MarginContainer/VSplitContainer/BackButton

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://root.tscn")

func _on_rich_text_label_meta_clicked(meta):
	if meta:
		OS.shell_open(meta)
