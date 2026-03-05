import bpy
import math
C = bpy.context

def rapply(x=0, y=0, z=0, apply=True):
    C.object.rotation_euler = [math.radians(x), math.radians(y), math.radians(z)]
    if apply:
        bpy.ops.object.transform_apply(location=False, rotation=True, scale=False, properties=False)

def sapply(x=None, y=None, z=None, apply=True):
    old_scale = C.object.scale
    if not x:
        x = old_scale[0]
    if not y:
        y = old_scale[1]
    if not z:
        z = old_scale[2]
    C.object.scale = [x, y, z]
    if apply:
        bpy.ops.object.transform_apply(location=False, rotation=False, scale=True, properties=False)

def relocate(x=0, y=0, z=0, apply=False):
    C.object.location = [x, y, z]
    if apply:
        bpy.ops.object.transform_apply(location=True, rotation=False, scale=False, properties=False)

#sapply(x=10, apply=False);