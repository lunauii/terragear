extends Control

@onready var yaitg_anim = $MarginContainer/HBoxContainer/Sidebar/MarginContainer/VBoxContainer/YAITGPlayer
@onready var credits = $MarginContainer/HBoxContainer/Sidebar/MarginContainer/VBoxContainer/CreditsSearch/MarginContainer/VBoxContainer/Credits
@onready var guide_data = "res://data/guide_data.txt"
@onready var guides = "res://data/guides/"
@onready var guide_container = $MarginContainer/HBoxContainer/PanelContainer/MarginContainer/ScrollContainer/Items
@onready var guide_image_container = $GuideImage/MarginContainer2/PanelContainer/ScrollContainer/GuideImageContainer
@onready var guide_image_exit = $GuideImage/MarginContainer2/PanelContainer/GuideImageExit
@onready var guide_image = $GuideImage
@onready var search_bar = $MarginContainer/HBoxContainer/Sidebar/MarginContainer/VBoxContainer/CreditsSearch/MarginContainer/VBoxContainer/Search
@onready var results_number = $Results
@onready var no_results_screen = $MarginContainer/HBoxContainer/PanelContainer/MarginContainer/NoResults

@onready var items = guide_container.get_children()

func _ready():
	yaitg_anim.play("rainbow")
	dir_contents(guides)

func _process(_delta):
	items = guide_container.get_children()

func dir_contents(path):
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			file_name = file_name.replace('.import', '') # <--- remove the .import
			
			if dir.current_is_dir():
				print("Found directory: " + file_name)

			#Check to see if a file ends with .import and skip over it.
			#Then, create a TextureButton with the scanned information.
			elif !file_name.ends_with('.import'):
				print("Found file: " + file_name)
				var texture = ResourceLoader.load(guides + file_name)

				var guide_button_instance = TextureButton.new()
				guide_button_instance.name = file_name.trim_suffix(".png")
				guide_button_instance.texture_normal = texture
				guide_button_instance.ignore_texture_size = true
				guide_button_instance.stretch_mode = TextureButton.STRETCH_SCALE
				guide_button_instance.custom_minimum_size = Vector2(200,300)
				guide_button_instance.pressed.connect(on_guide_button_pressed.bind(file_name, guide_button_instance))
				guide_button_instance.tooltip_text = (file_name.trim_suffix(".png"))
				guide_button_instance.theme = load("res://sniglet.tres")
				guide_container.add_child(guide_button_instance)
			else:
				print("Found file: " + file_name + " (Skipped over)")

			file_name = dir.get_next()
	else:
			print("An error occurred when trying to access the path.")


 
func _on_search_text_changed(new_text):
	var words = []
	var valid_items = []

	#Make search case insensitive
	new_text = new_text.to_lower()

	#If the search bar is empty, show everything.
	if new_text == "":
		for guide in items:
			guide.show()
		valid_items.clear()
		return
	
	#Create a new index in the words array when a space is entered
	words = new_text.split(" ")
	
	#Update valid_items variable
	valid_items = check_searched_phrase_against_items(words, valid_items)
	
	#Guide results feedback
	if valid_items.size() != 0:
		no_results_screen.hide()
	else:
		no_results_screen.show()

func check_searched_phrase_against_items(words, valid_items) -> Array:
	var counter : int = 0
	
	#Check if the guide is in each word. If true, append the guide to valid_items.
	for guide in items:
		for word in words:
			if guide.name.to_lower().contains(word) or word == "":
				counter += 1
			if counter == words.size():
				valid_items.append(guide)
		
		#Reset counter for each guide.
		counter = 0

		#If a guide is in valid_items, show it.
		if guide in valid_items:
			guide.show()
		else:
			guide.hide()

	return valid_items



func _on_credits_pressed():
	get_tree().change_scene_to_file("res://credits.tscn")

func on_guide_button_pressed(_file_name, button):
	var texture = button.texture_normal
	var guide_image_texture = TextureRect.new()
	guide_image_texture.texture = texture
	guide_image_texture.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	guide_image_container.add_child(guide_image_texture)
	
	guide_image.show()

func _on_guide_image_exit_pressed():
	guide_image.hide()
	guide_image_container.get_child(0).queue_free()



func _on_search_focus_entered():
	if DisplayServer.has
	DisplayServer.virtual_keyboard_show("")

func _on_search_focus_exited():
	DisplayServer.virtual_keyboard_hide()
