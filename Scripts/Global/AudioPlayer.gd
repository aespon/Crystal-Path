extends AudioStreamPlayer

var level_music = preload("res://Art/Music/Crystal Caves v1_2.mp3")
var volume = -1

func _play_music(music: AudioStream, volume):
	if stream == music:
		return
	stream = music
	volume_db = volume
	play()

func _play_music_level():
	_play_music(level_music, volume)
