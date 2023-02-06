extends VisibleOnScreenNotifier2D

## == VisibilityNotifier ======================================================
## This is a simple VisibleOnScreenNotifier2D that we are attaching code to
## so we can handle it in multiple classes without bulking down a majority of
## the code in the entity classes.
## ============================================================================

## == Variables ===============================================================

## == Initialization ==========================================================

## == Pre-Defined Methods =====================================================

## == Custom Methods ==========================================================

## == Setters & Getters =======================================================

## == Setters-Adjacent Methods ================================================

## == Signal-Related Methods ==================================================

func _on_screen_entered():
	var parent = get_parent()
	if parent.has_method("show_entity"):
		parent.show_entity()
	else:
		print("ERROR: 'show_entity' not found for ", parent.name)

func _on_screen_exited():
	var parent = get_parent()
	if parent.has_method("hide_entity"):
		parent.hide_entity()
	else:
		print("ERROR: 'hide_entity' not found for ", parent.name)
	

## == END OF FILE =============================================================

