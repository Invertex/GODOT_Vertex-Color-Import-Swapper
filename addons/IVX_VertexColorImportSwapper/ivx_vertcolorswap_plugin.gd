@tool
class_name IVX_VertColorSwapPlugin
extends EditorPlugin

# Plugin Settings Paths
const settings_root: StringName = "VertexColorSwapper/"
const settings_values: StringName = settings_root + "GLTF/Primary Vertex Color Sourcing/"

# Plugin Settings Values
const if_exists_copy_extras_attr: StringName = settings_values + "from_attribute_name_defined_in_this_extras_attribute"
const move_from_named_attribute: StringName = settings_values + "else from_this_named_attribute"
const move_from_color_1: StringName = settings_values + "else from_secondary_color_if_exists"

var gltf_ext : IVX_VertColorSwap_GLTFExtension = IVX_VertColorSwap_GLTFExtension.new()


func _enter_tree():
	if not ProjectSettings.has_setting(if_exists_copy_extras_attr):
		ProjectSettings.set_setting(if_exists_copy_extras_attr, "gltf_color_0")
	ProjectSettings.set_initial_value(if_exists_copy_extras_attr, "gltf_color_0")
	if not ProjectSettings.has_setting(move_from_named_attribute):
		ProjectSettings.set_setting(move_from_named_attribute, "_COLOR_0")
	ProjectSettings.set_initial_value(move_from_named_attribute, "_COLOR_0")
	if not ProjectSettings.has_setting(move_from_color_1):
		ProjectSettings.set_setting(move_from_color_1, true)
	ProjectSettings.set_initial_value(move_from_color_1, true)
	
	GLTFDocument.register_gltf_document_extension(gltf_ext, true)


func _exit_tree():
	GLTFDocument.unregister_gltf_document_extension(gltf_ext)
