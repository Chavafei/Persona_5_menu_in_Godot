@tool
extends EditorPlugin


func _enter_tree():
	# Initialization of the plugin goes here.
	pass


func _exit_tree():
	# Clean-up of the plugin goes here.
	pass
	
func _init():
	var is_editor: bool = Engine.is_editor_hint()
	if is_editor:
		add_autoload_singleton("JuicyPersist", "res://addons/juicy-effect/Logic/autoload/Juicy_persist.gd")
