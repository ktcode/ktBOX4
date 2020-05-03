//
// ktBOX4
//
//


gap1 = 0.001;
gap2 = 0.002;

panel_thick = 2;

X = 60;
Y = 38;
Z = 20;


key_pitch_x = 19;
key_pitch_y = 19;
hole_x = 14;
hole_y = 14;
keybase_thick = 5;

A = 1;
B = 0;

if(A)
{
difference()
{
    union()
    {
        translate([0, 0, 0]) cube([X+panel_thick*2, Y+panel_thick*2, Z+panel_thick]);
    }
    translate([panel_thick+10, panel_thick, -gap1]) cube([X-10, Y, Z]);
    translate([panel_thick, panel_thick+10, -gap1]) cube([10+gap1, Y-10, Z]);
    translate([10+panel_thick, panel_thick, -gap1]) rotate([0, 0, 45]) cube([10, 10*sqrt(2), Z]);
    translate([8.5, 1.5, -gap1]) rotate([0, 0, 45]) cube([10, 10, 10]);
    translate([11.5, 0, -gap1]) rotate([0, 0, 90+45]) cube([50, 50, 50]);
    //SW hole
    translate([0, 0, Z-5]) rotate([90, 0, -45]) cylinder(30, d=4.5+1, center=true, $fn=100);
    //board
    #translate([-gap1, Y-2, 4.5]) rotate([180, 0, 0]) board();
    translate([1.5-0.5, Y-2, 4.5]) rotate([180, 0, 0]) cube([7.5, 10+1, 7.5]);
    //Key hole
    translate([(X+panel_thick*2)/2-key_pitch_x/2, (Y+panel_thick*2)/2-key_pitch_y/2, Z+panel_thick-keybase_thick+gap1]) cube([key_pitch_x, key_pitch_y, keybase_thick]);
}
//screw
translate([panel_thick, Y/2-8/2, 0]) Fscrew();
translate([X+panel_thick, Y/2+8/2, 0]) rotate([0, 0, 180]) Fscrew();
//Spacer1
translate([X, Y-16, 7]) rotate([0, 45, 0]) cube([1.6, 18, 4]);
translate([X, Y-16, 0]) cube([3, 18, 7]);
//Spacer2
translate([X, Y-0.5, 7]) rotate([0, 45, 90]) cube([1.8, 18, 4]);
translate([X, Y-0.5, 0]) rotate([0, 0, 90]) cube([3, 18, 7]);
//Key
translate([(X+panel_thick*2)/2-key_pitch_x/2, (Y+panel_thick*2)/2-key_pitch_y/2, Z+panel_thick]) key(0,0);
//base
translate([X+panel_thick-2, (Y+panel_thick*2)/2-Y/2, Z+panel_thick-keybase_thick]) cube([2, Y, keybase_thick]);
translate([(X-4+panel_thick*2)/2+key_pitch_x/2-2, panel_thick, Z+panel_thick-keybase_thick]) cube([2, 10, keybase_thick]);
translate([(X-4+panel_thick*2)/2+key_pitch_x/2-2, (Y+panel_thick*2)-12, Z+panel_thick-keybase_thick]) cube([2, 12, keybase_thick]);
//tower
translate([panel_thick, (Y+panel_thick*2)-16, 5.2]) cube([3, 16, Z-5.2]);
translate([(X-3+panel_thick*2)/2-key_pitch_x/2, (Y+panel_thick*2)-14, 5.2]) cube([12, 14, Z-5.2-3]);
translate([(X-3+panel_thick*2)/2-key_pitch_x/2, (Y+panel_thick*2)-12, Z-3]) cube([12, 12, 3]);
}
if(B)
{
difference()
{
    union()
    {
        translate([panel_thick, panel_thick, 0]) cube([X, Y, panel_thick]);
    }
    translate([10+4, 0, -panel_thick-gap1]) rotate([0, 0, 90+45]) cube([50, 50, 50]);
    translate([0, Y-2-(10/2-7.5/2)-7.5, 0]) cube([6, 7.5, panel_thick+gap1]);
    
    difference()
    {
        union()
        {
        translate([panel_thick*2, panel_thick*2, 0]) cube([X-panel_thick*2, Y-panel_thick*2, panel_thick+gap1]);
        }
        translate([10+4+3, 0, -panel_thick-gap1]) rotate([0, 0, 90+45]) cube([50, 50, 50]);
    }
}
translate([8.5, 1.5, -gap1]) rotate([0, 0, 45]) cube([4, 10, panel_thick]);
difference()
{
    union()
    {
        translate([0, 0, -panel_thick]) cube([X+panel_thick*2, Y+panel_thick*2, panel_thick]);
    }
    translate([10, 0, -panel_thick-gap1]) rotate([0, 0, 90+45]) cube([50, 50, 50]);
    translate([10, Y-2-10, -panel_thick-gap1]) cube([12, 10, panel_thick+gap2]);
}
}

module key( x, y, w=1 ){
    translate( [key_pitch_x*x + key_pitch_x/2 + key_pitch_x*(w - 1)/2, key_pitch_y*y + key_pitch_y/2, -(keybase_thick/2)] ){
        difference(){
            cube( [key_pitch_x*w, key_pitch_y, keybase_thick], center=true );
            cube( [hole_x, hole_y, keybase_thick + gap2], center=true );
            translate( [0, -hole_y/2, keybase_thick/2 - 1.5] )
            claw();
            translate( [0, hole_y/2, keybase_thick/2 - 1.5] )
            rotate( [0, 0, 180] )
            claw();
            translate( [hole_x/2, 0, keybase_thick/2 - 1.5] )
            rotate( [0, 0, 90] )
            claw();
            translate( [-hole_x/2, 0, keybase_thick/2 - 1.5] )
            rotate( [0, 0, -90] )
            claw();
            translate( [0, 0, keybase_thick + 2] )
            rotate( [180, 0, 45] )
            cylinder( hole_y*1.1, hole_y*1.1, 0, $fn=4 );
        }
    }
}
module claw(){
    translate( [-2, -1, -1] ){
        difference(){
            union(){
                cube( [4, 2, 1] );
                rotate( [-45, 0, 0] )
                cube( [4, 2, 1] );
            }
            translate( [-gap1, 1+gap1, -2-gap1] )
            cube( [4+gap2, 2, 3+gap2] );
        }
    }
}

module board()
{
    difference()
    {
        union()
        {
            translate([1.5, 0, 0]) cube([57.5, 10+1, 1]);
            translate([0, (10+1)/2-(7.5+1)/2, 1]) cube([5.5, 7.5+1, 3.5]);
            translate([5.5, 0, 1]) cube([14.3, 10+1, 1]);
            translate([5.5, 0, -0.5]) cube([14.3, 10+1, 0.5]);
            translate([20, 0, 1]) cube([13, 10+1, 2.5]);
            translate([20, 0, -0.7]) cube([13, 10+1, 0.7]);
            translate([36, 0, 0]) cube([5, 10+1, 2]);
            translate([42.5, (10+1)/2-(13/2), 0]) cube([17.5, 13+1, 2]);
            translate([42.5, (10+1)/2-(13/2), -11]) cube([17.5, 13+1, 11]);
            
            translate([38, -3, -12]) cube([23.5, 36.2, 1]);
        }
    }
}

module Fscrew()
{
    difference()
{
    union()
    {
        cube( [10, 8, 12] );
    }
    translate([0, -gap1, 12]) rotate([0, 45, 0]) cube( [20, 8+gap2, 10] );
    translate([10/2, 8/2, 0]) cylinder(10, 1.6, 1.6, $fn=30);
    translate([10/2, 8/2, -gap1]) cylinder(2.4+0.15, 6.5/2+0.1, 6.5/2+0.1, $fn=6);
}
}