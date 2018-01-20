
include <../config.scad>;
use <../corners.scad>;

module wall_side_without_holes()
{
    // vertical side bar
    translate([0, 0, wall_z/2])
    cube([
        material_z,
        wall_y,
        wall_z
        ], center=true);

    // rounded top excrescence
    translate([0, 0, wall_z])
    rotate([90, 0, 90])
    round_tip(wall_y, wall_round_vertical_z, material_z, wall_y/4);

    if (!wall_has_feet)
    {
        // rounded bottom excrescence
        rotate([90, 180, 90])
        round_tip(wall_y, wall_round_vertical_z, material_z, wall_y/4);
    }
    else
    {
        // horizontal foot bars
        translate([0, -(foot_y_front - foot_round_y)/2, +foot_z/2])
        cube([
            material_z,
            foot_y_front - foot_round_y,
            foot_z
            ], center=true);

        translate([0, (foot_y_back - foot_round_y)/2, +foot_z/2])
        cube([
            material_z,
            foot_y_back - foot_round_y,
            foot_z
            ], center=true);

        // round corners on top of the foot
        translate([0, wall_y/2, foot_z])
        rotate([0, -90, 0])
        round_corner_inside(
            wall_y,
            foot_y_back - wall_y/2 - foot_round_y,
            material_z
            );

        translate([0, -wall_y/2, foot_z])
        rotate([0, -90, 180])
        round_corner_inside(
            wall_y,
            foot_y_front - wall_y/2 - foot_round_y,
            material_z
            );

        // round corners on the sides of the foot
        translate([0, foot_y_back - foot_round_y, 0])
        rotate([90, 0, 90])
        round_corner_outside(
            foot_round_y,
            foot_z,
            material_z
            );

        translate([0, - foot_y_front + foot_round_y, 0])
        rotate([90, 0, -90])
        round_corner_outside(
            foot_round_y,
            foot_z,
            material_z
            );
    } // wall_has_feet
}

module wall_side()
{
    difference()
    {
        wall_side_without_holes();

        // nose cutouts for horizontal beams
        usable_z = wall_z - support_z_offset;
        delta_z = usable_z / (support_count-1);
        offset_z = support_z_offset  - support_z/2;
        color("brown")
        for (i=[1:support_count])
        {
            translate([
                0,
                0,
                offset_z + (i-1) * delta_z
                ])
            cube(
                [
                material_z*2,
                material_z,
                support_z/2
                ], center=true);
        }

        if (wall_has_feet)
        {
            // foot gap
            translate([
                0,
                (foot_y_back - foot_y_front)/2,
                foot_gap_z/2
                ])
            cube([
                material_z*2,
                foot_gap_y,
                foot_gap_z + nothing
                ], center=true);
        } // wall_has_feet
    }
}

wall_side();
