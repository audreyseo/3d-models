import bpy
transform = bpy.ops.transform

C = bpy.context

C.object.location = (0, 0, 0)
#transform.resize(value=(15, 15, 1))