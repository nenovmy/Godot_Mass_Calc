# Godot Mass Calc

A Godot Engine addon to calculate the mass of a selected rigid body node. If the selected node is not a rigid body, the addon will traverse its direct children and compute the mass for any rigid body found.

## Features

- Initiate mass calculation via the tools menu: `Project -> Tools -> Undead Swarm Games`. Select from predetermined materials, or easily add your own.
- If a Rigid Body is selected, the mass for this particular rigid body will be computed.
- If any other node is selected, the addon will sift through the direct children of this node and calculate the mass of all rigid body children found.
- Utilizes the Mesh of the rigid body to compute the mass, assuming a convex mesh. Note: If the mesh is not convex, the results may not be accurate!

## Installation

1. Download or clone this repository.
2. Copy the `godot_mass_calc` folder into the `addons` folder of your Godot project.
3. In Godot, go to `Project -> Project Settings -> Plugins` and enable the `Godot Mass Calc` plugin.

## Usage

1. Select a Rigid Body or any other node in the scene tree.
2. Navigate to `Project -> Tools -> Undead Swarm Games` in the Godot editor.
3. Choose a material to compute the mass of the selected rigid body or the rigid bodies among the direct children of the selected node.

## Extending

Adding more materials is straightforward:

1. Locate the `SetMassPlugin.gd` script within the `mass_calc` folder.
2. In `enter_tree()` function add a new sub-menu item for the new material.
3. In `id_pressed()` function add the mass for the new material in kg ber cubic meter.

## License

This project is licensed under the MIT License - see the [LICENSE](addons/mass-calc/LICENSE) file for details.

## Support

If you encounter any issues or have suggestions, please [open an issue](https://github.com/nenovmy/Godot_Mass_Calc/issues) or submit a pull request.
