
include <config.scad>;
use <corners/corners.scad>;

module side_extension()
{
    translate([0, 0, side_extension_z/2])
    cube([
        material_z,
        side_extension_y,
        side_extension_z
        ], center=true);
}

module side_without_holes()
{
    // Middle support
    translate([
        0,
        0,
        side_size_z/2 + side_offset_z
        ])
    cube([
        material_z,
        side_size_y,
        side_size_z - side_offset_z
        ], center=true);

    // Front side leg
    translate([
        0,
        -side_size_y/2 - side_extension_y/2 + nothing,
        0
        ])
    side_extension();

    // Back side leg
    translate([
        0,
        +side_size_y/2 + side_extension_y/2 - nothing,
        0
        ])
    side_extension();
}

module side()
{
    side_without_holes();
}

side();
