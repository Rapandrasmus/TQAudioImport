extends Node2D

var fire_and_forget_sounds := []
var main_group

func _ready():
	TQAudio.initialize()
	main_group = TQAudio.create_group("Main", null)
	var sound = register_sound("res://Sounds/Samba De Ja Neiro.tres", "sound")
	fire_and_forget_sound(sound, main_group)

func _process(_delta):
	for i in range(fire_and_forget_sounds.size() - 1, -1, -1) :
		var sound := fire_and_forget_sounds[i] as TQAudioPlayer
		if (sound.is_at_stream_end()):
			sound.queue_free()
			fire_and_forget_sounds.remove_at(i)

func fire_and_forget_sound(audio_source : TQAudioSource, group : TQAudioGroup) :
	var player = audio_source.instantiate(group)
	add_child(player)
	player.start()
	player.process_mode = Node.PROCESS_MODE_ALWAYS
	fire_and_forget_sounds.append(player)

func register_sound(path: String, name_hint: String) -> TQAudioSource :
	var datasource = ResourceLoader.load(path).duplicate(true)
	var new_sound = TQAudio.register_sound_from_encoded_memory(name_hint, true, datasource.data)
	return new_sound
