@tool
extends Resource
class_name TQAudioData

@export var data : PackedByteArray

func load_data(path := ""):
	var f := FileAccess.open(path, FileAccess.READ)
	data = PackedByteArray(f.get_buffer(f.get_length()))
	f.close()
