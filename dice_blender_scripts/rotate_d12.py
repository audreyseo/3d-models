import bpy
import math
import sys
import os
#mr = bpy.data.texts["my_rotation"].as_module()
dir = os.path.dirname(bpy.data.filepath)
if not dir in sys.path:
    sys.path.append(dir )
    #print(sys.path)

#C = bpy.context
import my_rotation as mr

# For setup
mr.rapply(x=-58.285)


#n = 2

#mr.rapply(z=n * 36)
#mr.rapply(x=63.43, apply=False)

#C.object.rotation_euler = [0, 0, math.radians(n * 36)]
#bpy.ops.object.transform_apply(location=False, rotation=True, scale=False, properties=False)
#C.object.rotation_euler = [math.radians(63.43), 0, 0]