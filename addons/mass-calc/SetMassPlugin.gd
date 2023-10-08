@tool
extends EditorPlugin

var mass_calculator

func _enter_tree():
	mass_calculator = preload("res://addons/mass-calc/MassCalc.gd").new()
	var ppm := PopupMenu.new()
	ppm.add_item("Calculate Mass for Wood (500 kg/m³)", 1)
	ppm.add_item("Calculate Mass for Ice (918 kg/m³)", 2)
	ppm.add_item("Calculate Mass for Stone (2600 kg/m³)", 3)
	ppm.add_item("Calculate Mass for Steel (7800 kg/m³)", 4)

	add_tool_submenu_item("Undead Swarm Games", ppm)
	ppm.id_pressed.connect(Callable(id_pressed))

func id_pressed(id):
	print("id pressed: " + str(id))
	match id:
		1: calculate_mass(500.)
		2: calculate_mass(918.)
		3: calculate_mass(2600.)
		4: calculate_mass(7800.)
		_: print("No such matterial: " + str(id))

func _exit_tree():
	remove_tool_menu_item("Undead Swarm Games")

func calculate_mass(density:float):
	print("density is: " + str(density))
	var selected_node = get_editor_interface().get_selection().get_selected_nodes()[0]
	if selected_node is RigidBody3D:
		set_mass_to_rigid_body(selected_node, density)
	else:
		set_mass_to_children(selected_node, density)
	

func set_mass_to_children(selected_node, density: float):
	var total := 0.
	for p in selected_node.get_children():
		if p is RigidBody3D:
			var v := 1.
			for child in p.get_children():
				if child is MeshInstance3D:
					v = mass_calculator.calculate_volume(child.mesh)
					total += v
			if v > 0.:
				p.mass = v*density
				print("volume: " + str(v) + "  mass: " + str(p.mass))
	print("total volume: " + str(total) + "  total mass: " + str(total * density))

func set_mass_to_rigid_body(rb: RigidBody3D, density: float):
	var v := 1.
	for child in rb.get_children():
		if child is MeshInstance3D:
			v = mass_calculator.calculate_volume(child.mesh)
	if v > 0.:
		rb.mass = v*density
		print("volume: " + str(v) + "  mass: " + str(rb.mass))