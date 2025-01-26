import bpy
import math
C = bpy.context



def applyRotation(x=0, y=0, z=0, apply=True):
    global C
    C.object.rotation_euler = [math.radians(x), math.radians(y), math.radians(z)]
    if apply:
        bpy.ops.object.transform_apply(location=False, rotation=True, scale=False, properties=False)
        pass
    pass

def hubToFirst():
    # For 20 -> 14, 1 -> 19
    applyRotation(z=60)
    applyRotation(x=41.81)
    pass

def hubToOther():
    # 20 -> (8, 2)
    applyRotation(z=120)
    applyRotation(x=41.81)
    pass

def hubAdjacentToFirst():
    applyRotation(z=60)
    applyRotation(x=41.81, apply=False)
    pass

def hubAdjacentToSecond():
    applyRotation(z=-120)
    applyRotation(x=41.81, apply=False)
    pass

def hubAdjacentToHub():
    applyRotation(z=60)
    applyRotation(x=-41.81)
    
# setup
applyRotation(x=20.905)

# 20 -> 14, 1 -> 19
#hubToFirst()
# 20 -> (8, 2), 1 -> (13, 7)
#hubToOther()

# 14 -> (6), 8 -> (10), 2 -> 18, 19 -> 9, 13 -> 5, 7 -> 17
#hubAdjacentToFirst()

# 14 -> 4, 8 -> 16, 2 -> 12, 19 -> 3, 13 -> 11, 7 -> 15
#hubAdjacentToSecond()



# 14 -> 20, 8 -> 20, 2 -> 20
#hubAdjacentToHub()
#applyRotation(z=60)
#applyRotation(x=-41.81)
