func calculate_tetrahedron_volume(v0, v1, v2, v3) -> float:
	var normal = (v1 - v0).cross(v2 - v0)
	var height = abs(normal.dot(v3 - v0)) / normal.length()
	var base_area = 0.5 * normal.length()
	var volume = (1.0 / 3.0) * base_area * height
	return volume

func calculate_volume(mesh) -> float:
	var faces = mesh.get_faces()
	var volume = 0.0
	var reference_vertex = faces[0]
	for i in range(3, faces.size(), 3):
		var v1 = faces[i]
		var v2 = faces[i + 1]
		var v3 = faces[i+2]
		if reference_vertex == v1 || reference_vertex == v2 || reference_vertex == v3:
			continue
		var vol := calculate_tetrahedron_volume(reference_vertex, v1, v2, v3)
		if is_nan(vol):
			print("vol is NaN!")
		else:
			volume += vol
	return volume

func calculate_mass(node):
	return calculate_volume(node.mesh)