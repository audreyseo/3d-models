import bpy

C = bpy.context

x = 0
y = 0
if len(C.object.name) > 1:
    x = .25
    y = -0.3
    pass

C.object.location = (x, y, 10.15)
bpy.ops.transform.resize(value=(45, 45, 10))