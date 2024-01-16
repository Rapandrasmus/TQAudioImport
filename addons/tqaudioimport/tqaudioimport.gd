@tool
extends EditorPlugin

var dock

func _enter_tree():
	add_custom_type("TQAudioData", "Resource", preload("tqaudio_data.gd"), preload("icon.png"))
	
	dock = preload("res://addons/tqaudioimport/tq_audio_import.tscn").instantiate()
	add_control_to_dock(EditorPlugin.DOCK_SLOT_LEFT_UL, dock)


func _exit_tree():
	remove_custom_type("TQAudioData")
	
	remove_control_from_docks(dock)
	dock.free()
