
include <config.scad>;
use <bottom.scad>;

module layer()
{
    difference()
    {
        bottom();
        
        // Holes for the reaction glasses
        free_x = layer_size_x - 2*snap_joint_cutout_height;
        hole_spacing = (free_x - hole_count*hole_diameter)/(hole_count+1);
        start_x = -layer_size_x/2 + snap_joint_cutout_height;
        for (i=[1:hole_count])
        {
            translate([
                start_x + i*hole_spacing + hole_diameter*(i-1/2), 0, 0
                ])
            cylinder(r=hole_diameter/2, h=material_z*2, center=true);
        }
    }
}

layer();
