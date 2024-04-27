# Vertex Color Import Swapper - addon for Godot 4

Allows importing to automatically move vertex color data from a different file attribute into the primary vertex color attribute.

>Currently only handles GLTF files
>
>Will automatically handle the proposed Blender GLTF export change of storing vertex color in the second channel (if that proposal goes through).**

Adds options to also define yourself where you want the primary vertex color data to be sourced from in the file:

![](https://github.com/Invertex/GODOT_Vertex-Color-Import-Swapper/raw/master/GitAssets/settings_image.png)

The first option defines what "extras" attribute to look for a vertex-color attribute name in.

Example in Blender:

![](https://github.com/Invertex/GODOT_Vertex-Color-Import-Swapper/raw/master/GitAssets/extras_attribute_reference_option.png)

`gltf_color_0` in the "Custom Properties" section defines an Attributes name, in this case `_OUTLINECOLOR`, and as you can see, I have such a named attribute in the "Attributes" section of my Object. That is the attribute the importer will look for.
This allows you to use different attribute names in different objects and have this importer still handle it, instead of only being able to read one defined name in the Godot settings.

If `gltf_color_0` is not found, then it will default to looking for an Attribute with the name you define in the second option of this addon's settings. `_COLOR_0` in my example (default setting).

And if it finds neither of those, it will then see if there's already a secondary Vertex color channel in the asset, and will move it to the the First Vertex Channel for use in your shaders.


# Exporting "extras" from Blender

To make sure "extras" are exported for your objects in Blender, you need to make sure this Export setting is checked:

![](https://github.com/Invertex/GODOT_Vertex-Color-Import-Swapper/raw/master/GitAssets/blender_export_extras_setting.png)
