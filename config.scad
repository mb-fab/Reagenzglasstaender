
$fn = 100;
nothing = 0.01;

// Material to cut from
material_z = 3;

// Layer size
layer_size_x = 150;
layer_size_y = 30;

// Flask cutout properties
hole_count = 4;
hole_diameter = 20;

// Layer heights
bottom_offset_z = 40;
layer_offset_z = 80;

// Side properties
side_size_y = layer_size_y;
side_size_z = 86;
side_offset_z = 5;
side_extension_y = 20;
side_extension_z = 30;

// Snap connector properties
snap_joint_width = 25;
snap_joint_height = 25;
snap_joint_feather_width = 5;
snap_joint_feather_hook_width = 2;
snap_joint_feather_hook_height = 5;
snap_joint_feather_hook_cutaway = 3;
snap_joint_feather_base_height = 0.5;
snap_joint_stick_width = 5;

snap_joint_cutout_height = snap_joint_height - snap_joint_feather_hook_height - material_z;
snap_joint_cutout_width = snap_joint_width + 2;
