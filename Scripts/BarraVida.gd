extends ProgressBar

var maxVida = 200


func _ready():
	Global.life = 1000

func _physics_process(delta):
	value = Global.life
