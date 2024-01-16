@tool
extends Button

@export var dialog : FileDialog

func _ready():
	pressed.connect(on_press)
	dialog.add_filter("*.ogg, *.mp3, *.wav, *.flac", "Audio Files")

func on_press() :
	dialog.visible = true


func _on_file_dialog_file_selected(path):
	var audio_data = TQAudioData.new()
	audio_data.load_data(path)
	ResourceSaver.save(audio_data, "res://" + path.get_slice("/", path.get_slice_count("/") - 1).get_slice(".", 0) + ".tres")


func _on_file_dialog_files_selected(paths):
	for path : String in paths :
		var audio_data = TQAudioData.new()
		audio_data.load_data(path)
		print(audio_data.data.size())
		var save_path := "res://" + path.get_slice("/", path.get_slice_count("/") - 1).get_slice(".", 0) + ".tres"
		ResourceSaver.save(audio_data, save_path)
