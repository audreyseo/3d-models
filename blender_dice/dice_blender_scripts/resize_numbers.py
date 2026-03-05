import bpy
transform = bpy.ops.transform

C = bpy.context

# d4 font relocating
#C.object.location = (0, 6, 5.45)
#transform.resize(value=(15, 15, 1))

# d4: -19.47 x, 120 y, 19.47 x

# d4 gem relocating
#C.object.location = (0, 0, 5.5)
#transform.resize(value=(15, 15, 1))

# d8 relocating
#C.object.location = (0, 0, 8.5)
#transform.resize(value=(15, 15, 1))

# d10 relocating
#C.object.location = (0, -0.6, 8.8)
#transform.resize(value=(15, 15, 1))

#d100 resizing
#C.object.location = (0, -0.75, 8.8)
#transform.resize(value=(10, 10, 1))

# d20 relocating
C.object.location = (0, 0, 10.3)
transform.resize(value=(8, 8, 1))