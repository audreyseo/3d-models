import bpy
import math
C = bpy.context

n = 2

C.object.rotation_euler = [math.radians(-35.265), 0, 0]
bpy.ops.object.transform_apply(location=False, rotation=True, scale=False, properties=False)
C.object.rotation_euler = [0, math.radians(-90), 0]
bpy.ops.object.transform_apply(location=False, rotation=True, scale=False, properties=False)
C.object.rotation_euler = [math.radians(35.265), 0, 0]
bpy.ops.object.transform_apply(location=False, rotation=True, scale=False, properties=False)