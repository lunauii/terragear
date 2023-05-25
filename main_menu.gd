extends Control

@onready var yaitg_anim = $MarginContainer/HBoxContainer/Sidebar/MarginContainer/VBoxContainer/YAITGPlayer
@onready var credits = $MarginContainer/HBoxContainer/Sidebar/MarginContainer/VBoxContainer/CreditsSearch/MarginContainer/VBoxContainer/Credits

func _ready():
	yaitg_anim.play("rainbow")

func _on_credits_pressed():
	get_tree().change_scene_to_file("res://credits.tscn")

