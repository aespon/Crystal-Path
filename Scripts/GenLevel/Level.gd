extends Node2D

var borders = Rect2(1, 1, 20, 10)



#@onready var tileMap = $TileMap
@onready var room2 = [ load("res://Scenes/Base/rooms/room_2.tscn"), 
load("res://Scenes/Base/rooms/room_3.tscn"), 
load("res://Scenes/Base/rooms/room_4.tscn")
]
@onready var play = load("res://Scenes/Base/Player/Personaje.tscn")
@onready var room1 = load("res://Scenes/Base/rooms/room_1.tscn")
@onready var boss = load("res://Scenes/Base/rooms/boss.tscn")


func _ready():
	AudioPlayer.volume = -9
	AudioPlayer._play_music_level()
	randomize()
	generate_level()
	

#generacion de nivel (visual)
func generate_level():

	var a = 35
	var walker = Walker.new(Vector2(19, 2), borders)
	var mapa = walker.walk(35)
	
	walker.queue_free()
	# estas lineas se deshacen de todos los duplicados dentro del array que devuelve el walker.
	var mapi := {}
	for n in mapa:
		if not n in mapi:
			mapi[n] = null 
	var map = mapi.keys()
	
	# este for pone las habitaciones (tiene 2 que si o si estan y las otras estan randomizadas)
	for location in map:
		if (a== 35):
			var player = play.instantiate()
			player.position = Vector2(location.x * 103, location.y * 120)
			player.z_index = 1
			add_child(player)
			var rooms1 = room1.instantiate()
			rooms1.position = Vector2(location*100)
			add_child(rooms1)
			a = a - 1
			print(a)
		else:
			if (a == 27):
				var boss1 = boss.instantiate()
				boss1.position = Vector2(location*100)
				add_child(boss1)
				a = a - 1
			else:
				var r = randi_range(0, 2)
				var rooms = room2[r].instantiate()
				rooms.position = Vector2(location*100)
				add_child(rooms)
				a = a - 1
				print(a)

		

func reload_level():
	get_tree().reload_current_scene()

func _input(event):
	if event.is_action_pressed("ui_accept"):
		reload_level()
