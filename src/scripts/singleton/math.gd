extends Node

## == Math ====================================================================
## There are plenty of math functions that are specific to what we need and 
## would not be included in the Godot engine by default. This singleton holds
## those such functions.
## ============================================================================

## == Variables ===============================================================

## == Initialization ==========================================================

## == Pre-Defined Methods =====================================================

## == Custom Methods ==========================================================

func map_to_world(map : Vector3, tile_size : Vector2 = Globals.TILE_SIZE,
	offset : Vector2 = Vector2.ZERO) -> Vector2:
	var screen : Vector2 = Vector2.ZERO
	screen.x = (map.x - map.y) * (0.5 * tile_size.x) + offset.x
	screen.y = (map.x + map.y) * (0.5 * tile_size.y) + offset.y
	return screen

func map_to_world2D(map : Vector2, tile_size : Vector2 = Globals.TILE_SIZE,
	offset : Vector2 = Vector2.ZERO) -> Vector2:
	var screen : Vector2 = Vector2.ZERO
	screen.x = (map.x - map.y) * (0.5 * tile_size.x) + offset.x
	screen.y = (map.x + map.y) * (0.5 * tile_size.y) + offset.y
	return screen

func world_to_map(screen : Vector2, offset : Vector2 = Vector2.ZERO) -> Vector2i:
	var map : Vector2i = Vector2i.ZERO
	var SIZE = Globals.TILE_SIZE
	screen -= offset
	map.x = int(screen.x / SIZE.x + screen.y / SIZE.y)
	map.y = int(screen.y / SIZE.y - screen.x / SIZE.x)
	return map

## == Setters & Getters =======================================================

## == Setters-Adjacent Methods ================================================

## == Signal-Related Methods ==================================================

## == END OF FILE =============================================================
