extends Node2D

## == BaseScenario ============================================================
## We want a place that will handle all the elements when we play a level. This
## is the basis for a level.
## ============================================================================

## == Variables ===============================================================

var world_size : Vector2i = Vector2i(5, 5)

## == Initialization ==========================================================

func _ready() -> void:
	var terrainObj = preload("res://entities/objects/terrain_object.tscn")
	for _y in world_size.y: for _x in world_size.x:
		var instance = terrainObj.instantiate()
		$TerrainManager.add_child(instance)
		instance.setLocation(Vector3i(_x, _y, 0))
	
	var sceneryObj = preload("res://entities/objects/scenery_object.tscn")
	for vec in [Vector3i.ZERO]:#, Vector3i(1,0,0),
		#Vector3i(0,0,2), Vector3i(1,1,2), Vector3i(1,0,2)]:
		var instance = sceneryObj.instantiate()
		$SceneryManager.add_child(instance)
		instance.setLocation(vec)
	
	var smallObj = preload("res://entities/objects/small_scenery_object.tscn")
	var vectors = [Vector3i(1,1,0), Vector3i(2,1,0), Vector3i(3,3,0), 
		Vector3i(3,3,1), Vector3i(3,3,2)]
	var quads = [0, 1, 2, 2, 2]
	#for i in range(vectors.size()):
	#	var instance = smallObj.instantiate()
	#	$SceneryManager.add_child(instance)
	#	instance.setLocation(vectors[i])
	#	instance.setQuadrant(quads[i])
	
	var wallObj = preload("res://entities/objects/wall_object.tscn")
	vectors = [Vector3i.ZERO, Vector3i(0,4,0)]
	for i in range(vectors.size()):
		for edge in [ObjectPlacement.Edge.E, ObjectPlacement.Edge.W]:
			var instance = wallObj.instantiate()
			$SceneryManager.add_child(instance)
			instance.setLocation(vectors[i])
			instance.setEdge(edge)
	
	vectors = [Vector3i(4,4,0), Vector3i.ZERO, Vector3i(0,4,0)]
	for i in range(vectors.size()):
		for edge in [ObjectPlacement.Edge.N, ObjectPlacement.Edge.S]:
			var instance = wallObj.instantiate()
			$SceneryManager.add_child(instance)
			instance.setLocation(vectors[i])
			instance.setEdge(edge)

## == Pre-Defined Methods =====================================================

## == Custom Methods ==========================================================

## == Setters & Getters =======================================================

## == Setters-Adjacent Methods ================================================

## == Signal-Related Methods ==================================================

## == END OF FILE =============================================================
