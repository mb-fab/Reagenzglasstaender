
include <config.scad>;
use <snap-joint/snap-joint.scad>;

module bottom()
{
    snap_joint_cutout_offset_y = (layer_size_y - snap_joint_cutout_width)/2;

    snap_joint_cutout_x = layer_size_x/2 - snap_joint_cutout_height;

    difference()
    {
        // Plate
        cube([
            layer_size_x,
            layer_size_y,
            material_z
            ], center=true);

        // Room for the left snap joint
        translate([
            - snap_joint_cutout_height/2 - snap_joint_cutout_x - nothing, 0, 0
            ])
        cube([
            snap_joint_cutout_height,
            snap_joint_cutout_width,
            material_z + 2*nothing
            ], center=true);

        // Room for the right snap joint
        translate([
            snap_joint_cutout_height/2 + snap_joint_cutout_x + nothing, 0, 0
            ])
        cube([
            snap_joint_cutout_height,
            snap_joint_cutout_width,
            material_z + 2*nothing
            ], center=true);
    }

    // Left snap joint
    translate([
        -snap_joint_cutout_x, 0, 0
        ])
    rotate([0, 0, 90])
    snap_joint();

    // Right snap joint
    translate([
        snap_joint_cutout_x, 0, 0
        ])
    rotate([0, 0, -90])
    snap_joint();
}

bottom();
