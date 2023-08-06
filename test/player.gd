extends Sprite3D

@export var speed : float = 1

@export var joystick_left : VirtualJoystick
@export var joystick_right : VirtualJoystick

var move_vector := Vector3.ZERO

func _process(delta: float) -> void:
    # Movement using Input functions:
    move_vector = Vector3.ZERO
    move_vector.x = Input.get_axis("ui_left", "ui_right")
    move_vector.y = Input.get_axis("ui_up", "ui_down")
    move_vector.z = Input.get_axis("ui_front", "ui_back")
    transform.origin += move_vector * speed * delta
    
    # Rotation:
    if joystick_right and joystick_right.is_pressed:
        var angle = joystick_right.output.angle()
        rotation_degrees = Vector3(0, rad_to_deg(angle), 0)
