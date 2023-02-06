extends StaticObject
class_name SceneryObject

## == Class Name ==============================================================
## Class description goes here...
## ============================================================================

## == Variables ===============================================================

## == Initialization ==========================================================

func _ready() -> void:
	var rand_id = 3 + randi() % 2
	#$Sprites/Sprite2D.frame = rand_id

## == Pre-Defined Methods =====================================================

## == Custom Methods ==========================================================

## == Setters & Getters =======================================================

## == Setters-Adjacent Methods ================================================

func adjustDisplayHeight() -> void:
	$Sprites.position.y = -16 * _location.z

## == Signal-Related Methods ==================================================

## == END OF FILE =============================================================
