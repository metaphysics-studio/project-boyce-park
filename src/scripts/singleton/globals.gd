extends Node

## == Globals =================================================================
## Godot does not allow for static enums wtihin a class. This singleton will 
## handle all "constants" as if they were static variables within different 
## classes.
## ============================================================================

## == Variables ===============================================================

## Sizes
const TILE_SIZE : Vector2 = Vector2(64, 32)
const HALF_SIZE : Vector2 = TILE_SIZE / 2
const HEIGHT_OFFSET_PIXELS : int = -16

## Rotations
const CW : int = 1
const CCW : int = -1
const NO_ROTATION : int = 0

## == Initialization ==========================================================

## == Pre-Defined Methods =====================================================

## == Custom Methods ==========================================================

## == Setters & Getters =======================================================

## == Setters-Adjacent Methods ================================================

## == Signal-Related Methods ==================================================

## == END OF FILE =============================================================
