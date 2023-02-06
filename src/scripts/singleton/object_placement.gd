extends Node

## == ObjectPlacement =========================================================
## This is a resource that will act as a way to handle object management within
## the world.
## ============================================================================

## == Variables ===============================================================

## Constants - Placement
enum Type { TILE, CENTER, SMALL, LARGE, EDGE }
enum Quad { I, II, III, IV }

## Constants - Edges
enum Edge { N, E, S, W }
const EDGE_OFFSET : Dictionary = {
	Edge.N: Vector2(15, 9), Edge.E : Vector2(16, 24),
	Edge.S: Vector2(-16, 24), Edge.W : Vector2(-15, 9)
}
const EDGE_SPRITE_OFFSET : Array = [Vector2(-1, -16), Vector2(0,-16)]

## Constants - ZLevel
enum ZLevel { SAME = 0, ABOVE = 1, BELOW = -1 }

## == Initialization ==========================================================

## == Pre-Defined Methods =====================================================

## == Custom Methods ==========================================================

func determine_position(coordinate : Vector3i, type : Type, 
	params : Array = []) -> Vector2:
	
	## Get the tile's position.
	var world_position : Vector2 = Vector2.ZERO
	world_position = Math.map_to_world(coordinate)
	
	## Add the proper offset based on the type of placement
	## and its parameters. If type in [TILE, LARGE], there's
	## nothing special to do.
	
	## If center, move it to the center of the tile.
	if type == Type.CENTER:
		world_position += Vector2(0, Globals.TILE_SIZE.y/2)
	## If small, get the subcoordinate and tack it on.
	elif type == Type.SMALL: 
		var sub_coord = int(params[0])
		var xs = sub_coord % 2
		var ys = floor(sub_coord / 2)
		var vec2D = Vector2(xs, ys)
		var extra_bit = Math.map_to_world2D(vec2D, Globals.HALF_SIZE)
		world_position += extra_bit
		world_position += Vector2(0, Globals.HALF_SIZE.y/2)
	## If edge, move it to the proper edge of the tile.
	elif type == Type.EDGE:
		## Edges should have two parameters
		## 1. the edge
		## 2. thickness of the wall
		var edge = int(params[0])
		var thickness = int(params[1])
		world_position += EDGE_OFFSET[edge]
	
	return world_position

## == Setters & Getters =======================================================

## == Setters-Adjacent Methods ================================================

## == Signal-Related Methods ==================================================

## == END OF FILE =============================================================
