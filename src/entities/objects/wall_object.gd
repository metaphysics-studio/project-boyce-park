extends SceneryObject

## == WallObject ==============================================================
## This is an object for a wall that we can have on the level.
## ============================================================================

## == Variables ===============================================================

@export var _edge : ObjectPlacement.Edge = ObjectPlacement.Edge.N : 
	set = setEdge, get = getEdge

## == Initialization ==========================================================

## == Pre-Defined Methods =====================================================

## == Custom Methods ==========================================================

## == Setters & Getters =======================================================

func getEdge() -> ObjectPlacement.Edge:
	return _edge

func setEdge(e : ObjectPlacement.Edge) -> void:
	_edge = e
	if _placement_parameters.size() == 0:
		_placement_parameters = [e,1]
	else:
		_placement_parameters[0] = e
	adjustDisplayEdge()
	adjustDisplayPosition()

## == Setters-Adjacent Methods ================================================

func adjustDisplayEdge() -> void:
	var frame = (_edge + 1) % 2
	$Sprites/Sprite2D.position = ObjectPlacement.EDGE_SPRITE_OFFSET[frame]
	$Sprites/Sprite2D.frame = frame

## == Signal-Related Methods ==================================================

## == END OF FILE =============================================================
