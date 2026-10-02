extends Sprite2D

var rotating: bool = true
var rotation_speed: float = 5.0
var success: bool = false

func _process(delta: float) -> void:
	if rotating:
		rotation += rotation_speed * delta

func _on_area_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.is_in_group("player") and rotating:
		rotating = false

func _on_target_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.is_in_group("player"):
		success = true
		print("success")
