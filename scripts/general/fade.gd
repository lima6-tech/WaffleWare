extends CanvasLayer

@onready var anim: AnimationPlayer = $AnimationPlayer

func play(anim_name: String):
	if anim:
		if anim.has_animation(anim_name):
			anim.play(anim_name)
			await anim.animation_finished
		else:
			printerr("SceneTransition Error: Animation '", anim_name, "' not found!")
