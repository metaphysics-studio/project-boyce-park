extends Node2D
class_name BaseEntity

## == BaseEntity ==============================================================
## This is the class that will be the basis for objects within a game. We want
## to be able to handle the various types of entities all from one common 
## place. When fully implemented, this class will NEVER be instanced itself.
## Instead, you want to use the proper subclasses:
## 
## DynamicSpawn - moving, spawnable entities
## StaticObject - stationary, placeable entities
##
## ============================================================================

## == Variables ===============================================================

## Exported Variables
@export var _location : Vector3i = Vector3i.ZERO : 	# 3D coordinate in world
	set = setLocation, get = getLocation
	
@export var _is_destroyable : bool = true :			# allows to remove object
	set = setIsDestroyable, get = getIsDestroyable

@export var _placement_type : ObjectPlacement.Type = ObjectPlacement.Type.TILE :	# position on tile
	set = setPlacementType, get = getPlacementType
var _placement_parameters : Array = []

@export var _z_level : ObjectPlacement.ZLevel = ObjectPlacement.ZLevel.SAME : 
	set = setZLevel, get = getZLevel

## References
@onready var visibility_notifier = $VisibilityNotifier
@onready var animator_list = $Animators
@onready var sprite_list = $Sprites

## == Initialization ==========================================================

## == Pre-Defined Methods =====================================================

## == Custom Methods ==========================================================

## == Setters & Getters =======================================================

func setIsDestroyable(state : bool) -> void:
	_is_destroyable = state

func getIsDestroyable() -> bool:
	return _is_destroyable

func getLocation() -> Vector3i:
	return _location

func setLocation(new_location : Vector3i) -> void:
	_location = new_location
	adjustDisplayPosition()
	adjustDisplayZ()
	adjustDisplayHeight()

func getPlacementType() -> ObjectPlacement.Type:
	return _placement_type

func setPlacementType(type : ObjectPlacement.Type) -> void:
	_placement_type = type
	adjustDisplayPosition()

func getZLevel() -> ObjectPlacement.ZLevel:
	return _z_level

func setZLevel(lvl : ObjectPlacement.ZLevel) -> void:
	_z_level = lvl
	adjustDisplayZ()

## == Setters-Adjacent Methods ================================================

func adjustDisplayHeight() -> void:
	pass

func adjustDisplayPosition() -> void:
	global_position = ObjectPlacement.determine_position(_location,
		_placement_type, _placement_parameters)

func adjustDisplayZ() -> void:
	z_index = _location.z + _z_level
	

## == Signal-Related Methods ==================================================

## == END OF FILE =============================================================
