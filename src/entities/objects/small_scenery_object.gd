extends SceneryObject
class_name SmallSceneryObject

## == SmallSceneryObject ======================================================
## This is a type of scenery object that only takes up part of a tile.
## ============================================================================

## == Variables ===============================================================

@export var _quadrant : ObjectPlacement.Quad = ObjectPlacement.Quad.I :
	set = setQuadrant, get = getQuadrant

## == Initialization ==========================================================

func _ready() -> void:
	$Sprites/Sprite2D.frame = 5

## == Pre-Defined Methods =====================================================

## == Custom Methods ==========================================================

## == Setters & Getters =======================================================

func getQuadrant() -> ObjectPlacement.Quad:
	return _quadrant

func setQuadrant(quad : ObjectPlacement.Quad) -> void:
	_quadrant = quad
	if _placement_parameters.size() == 0:
		_placement_parameters = [quad]
	else:
		_placement_parameters[0] = quad
	adjustDisplayPosition()

## == Setters-Adjacent Methods ================================================

## == Signal-Related Methods ==================================================

## == END OF FILE =============================================================
