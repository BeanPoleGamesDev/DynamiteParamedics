extends ParallaxBackground


@export var speed: int = 1000
@export var rotation_speed: int = 0.3

var direction = Vector2(1,0)

func _process(delta: float) -> void:
	self.scroll_offset += direction * speed * delta
