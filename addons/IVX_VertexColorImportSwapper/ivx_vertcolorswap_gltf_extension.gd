@tool
class_name IVX_VertColorSwap_GLTFExtension
extends GLTFDocumentExtension

func _import_preflight(state:GLTFState, extensions:PackedStringArray):
	var extras_attr_name:String = ProjectSettings.get_setting_with_override(IVX_VertColorSwapPlugin.if_exists_copy_extras_attr);
	var from_named_attr:String = ProjectSettings.get_setting_with_override(IVX_VertColorSwapPlugin.move_from_named_attribute);
	var move_from_color_1:bool = ProjectSettings.get_setting_with_override(IVX_VertColorSwapPlugin.move_from_color_1);
	var checkExtra:bool = !extras_attr_name.is_empty()
	var move_from_named:bool = !from_named_attr.is_empty()
	
	if !checkExtra and !move_from_named and !move_from_color_1:
		return OK
	
	if !state.json.has("meshes"):
		return OK
	
	for mesh:Dictionary in state.json.meshes as Array:
		if !mesh.has("primitives") or mesh["primitives"].size() == 0:
			continue
		var attribs:Dictionary = mesh["primitives"][0]["attributes"];
		
		if checkExtra and mesh.has("extras") and mesh["extras"].has(extras_attr_name):
			var col_0_name:String = mesh["extras"][extras_attr_name]
			if attribs.has(col_0_name):
				attribs["COLOR_0"] = attribs[col_0_name]
				attribs.erase(col_0_name)
				continue
		
		if move_from_named and attribs.has(from_named_attr):
			attribs["COLOR_0"] = attribs[from_named_attr]
			attribs.erase(from_named_attr)
			continue
				
			
		if move_from_color_1 and attribs.has("COLOR_1"):
			attribs["COLOR_0"] = attribs["COLOR_1"]
			attribs.erase("COLOR_1")
			
	
	return OK
