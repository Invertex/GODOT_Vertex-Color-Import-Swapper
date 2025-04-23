@tool
class_name IVX_VertColorSwapPlugin
extends EditorPlugin

# Plugin Root Settings Path
const settings_root: StringName = "VertexColorSwapper/"

# Common Settings Paths
const if_exists_copy_extras_attr: StringName = "from_attribute_name_defined_in_this_extras_attribute"
const move_from_named_attribute: StringName = "else from_this_named_attribute"
const move_from_color_1: StringName = "else from_secondary_color_if_exists"

var gltf_ext : IVX_VertColorSwap_Ext_GLTF = IVX_VertColorSwap_Ext_GLTF.new()


func _enter_tree():
	GLTFDocument.register_gltf_document_extension(gltf_ext, true)


func _exit_tree():
	GLTFDocument.unregister_gltf_document_extension(gltf_ext)
