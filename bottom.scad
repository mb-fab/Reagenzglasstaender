
include <config.scad>;
use <snap-joint/snap-joint.scad>;

module bottom()
{
    snap_joint_cutout_offset_y = (layer_y - snap_joint_cutout_width)/2;

    difference()
    {
        // Plate
        translate([0, 0, -material_z/2])
        cube([
            layer_x,
            layer_y,
            material_z
            ]);

        // Room for the left snap joint
        translate([
            -nothing,
            snap_joint_cutout_offset_y,
            -material_z/2 - nothing
            ])
        cube([
            snap_joint_cutout_height,
            snap_joint_cutout_width,
            material_z + 2*nothing
            ]);

        // Room for the right snap joint
        translate([
            layer_x - snap_joint_cutout_height + nothing,
            snap_joint_cutout_offset_y,
            -material_z/2 - nothing
            ])
        cube([
            snap_joint_cutout_height,
            snap_joint_cutout_width,
            material_z + 2*nothing
            ]);
    }

    // Left snap joint
    translate([
        snap_joint_cutout_height,
        snap_joint_cutout_offset_y + snap_joint_cutout_width/2,
        0
        ])
    rotate([0, 0, 90])
    snap_joint();

    // Right snap joint
    translate([
        layer_x - snap_joint_cutout_height,
        snap_joint_cutout_offset_y + snap_joint_cutout_width/2,
        0
        ])
    rotate([0, 0, -90])
    snap_joint();
}

bottom();
