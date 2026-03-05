bpy.context.object.rotation_euler = [math.radians(-35.7), 0, 0]; bpy.ops.object.transform_apply(location=False, rotation=True, scale=False, properties=False); bpy.context.object.rotation_euler = [0, math.radians(-72), 0]; bpy.ops.object.transform_apply(location=False, rotation=True, scale=False, properties=False); bpy.context.object.rotation_euler = [math.radians(35.7), 0, 0]; bpy.ops.object.transform_apply(location=False, rotation=True, scale=False, properties=False)

# for placing d100 numbers
bpy.context.object.location = (0, -2.5, 8.4); transform.resize(value=(60, 60, 10))

# for placing d10 numbers
bpy.context.object.location = (0, -0.75, 8.4); transform.resize(value=(100, 100, 10))
