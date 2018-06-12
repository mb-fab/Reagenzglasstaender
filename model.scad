
include <config.scad>;
use <bottom.scad>;
use <layer.scad>;
use <side.scad>;

module model()
{
    // Top layer
    translate([
        0, 0, layer_offset_z
        ])
    layer();

    // Bottom layer
    translate([
        0, 0, bottom_offset_z
        ])
    bottom();

    // Left leg
    translate([
        -layer_size_x/2 - material_z/2, 0, 0
        ])
    side();

    // Right leg
    translate([
        layer_size_x/2 + material_z/2, 0, 0
        ])
    side();
}

model();
