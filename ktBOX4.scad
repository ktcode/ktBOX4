//
// ktBOX4
//
//


gap1 = 0.001;
gap2 = 0.002;

panel_thick = 2;
panel_thick2 = 2+2;

X = 60;
Y = 38;
Z = 20;
W1 = 23+panel_thick*2;
W2 = 30+panel_thick*2;
R = 7;


key_pitch_x = 19;
key_pitch_y = 19;
hole_x = 14;
hole_y = 14;
keybase_thick = 5;

A = 1;
B = 0;
C = 1;
D = 0;

if(A)
{
difference()
{
union()
{
difference()
{
    union()
    {
        translate([R/2, R/2, 0])
        minkowski()
        {
            cube([X+panel_thick*2-R, Y+panel_thick*2-R, Z+panel_thick-gap1]);
            cylinder(gap1, d=R, $fn=100);
        }
    }
    translate([panel_thick, panel_thick, -gap1]) cube([X, Y, Z]);
    //SW hole
    translate([8.5, 5.5, Z-5]) rotate([0, 0, -45]) cylinder(30, d=4.5+0.7, center=true, $fn=100);
    //code hole
    translate([-gap1, Y/2-4-4, -gap1]) cube([10, 4, Z/2]);
    //board
    #translate([-gap1, Y-2, 4.5]) rotate([180, 0, 0]) board();
    translate([1.5-0.5, Y-2, 4.5]) rotate([180, 0, 0]) cube([7.5, 10+1, 7.5]);
    //Key hole
    translate([(X+panel_thick*2)/2-(20+panel_thick*2)/2-8, (Y+panel_thick*2)/2-(20+panel_thick*2)/2, Z+panel_thick-keybase_thick+gap1]) cube([(20+panel_thick*2), (20+panel_thick*2), keybase_thick]);
}
//Key waku
translate([(X+panel_thick*2)/2-(20+panel_thick*2)/2-8, (Y+panel_thick*2)/2-(20+panel_thick*2)/2, Z-8+gap1]) waku();
//Key
translate([(X+panel_thick*2)/2-key_pitch_x/2-8, (Y+panel_thick*2)/2-key_pitch_y/2, Z+panel_thick-8]) key(0,0);
//screw
translate([panel_thick, Y/2-8/2, 0]) Fscrew();
translate([X+panel_thick, Y/2+8/2, 0]) rotate([0, 0, 180]) Fscrew();
//Spacer1
translate([X-0.5, Y-16, 7]) rotate([0, 45, 0]) cube([1.6, 18, 4]);
translate([X-0.5, Y-16, 0]) cube([3, 18, 7]);
//Spacer2
translate([X+2.4, Y-1, 7]) rotate([0, 45, 90]) cube([2.5, 10, 4.2]);
translate([X+2.4, Y-1, 0]) rotate([0, 0, 90]) cube([4, 10, 7]);
//base
translate([X+panel_thick-2, (Y+panel_thick*2)/2-Y/2, Z+panel_thick-keybase_thick]) cube([2, Y, keybase_thick]);
translate([(X-4+panel_thick*2)/2+key_pitch_x/2-3.5, panel_thick, Z+panel_thick-keybase_thick]) cube([2, Y, keybase_thick]);
translate([X-22, (Y+panel_thick*2)/2-Y/2, Z+panel_thick-keybase_thick]) cube([23, 2, keybase_thick]);
translate([X-22, Y, Z+panel_thick-keybase_thick]) cube([23, 2, keybase_thick]);
//tower
difference()
{
    union()
    {
        translate([panel_thick, (Y+panel_thick*2)-16, 5.2]) cube([3, 16, Z-5.2]);
        translate([(X-3+panel_thick*2)/2-key_pitch_x/2, (Y+panel_thick*2)-14, 5.2]) cube([12, 14, Z-5.2-3-8]);
        translate([(X-3+panel_thick*2)/2-key_pitch_x/2, (Y+panel_thick*2)-11.5, Z-3-8]) cube([12, 11.5, 3+8]);
    }
    translate([(X+panel_thick*2)/2-(20+panel_thick*2)/2-8+(20+panel_thick*2)/2, (Y+panel_thick*2)/2-(20+panel_thick*2)/2+(20+panel_thick*2)/2, Z-8+panel_thick+gap1]) rotate([0, 0, 45]) cylinder(8, d1=W1, d2=W2, $fn=4);
}
}
//design
translate([0, 0, Z+panel_thick-0.4]) rotate([45, 0, 36.6]) cube([16, 1, 1]);
translate([0, Y+panel_thick*2, Z+panel_thick-0.4]) rotate([45, 0, -36.6]) cube([16, 1, 1]);
translate([X+panel_thick*2, 1, Z+panel_thick-0.4]) rotate([45, 0, 163.5]) cube([32, 1, 1]);
translate([X+panel_thick*2, Y+panel_thick*2-1, Z+panel_thick-0.4]) rotate([45, 0, -163.5]) cube([32, 1, 1]);
}
}
if(B)
{
difference()
{
    union()
    {
        translate([R/2, R/2, -panel_thick2])
        minkowski()
        {
            cube([X+panel_thick*2-R, Y+panel_thick*2-R, panel_thick2-gap1]);
            cylinder(gap1, d=R, $fn=100);
        }
        translate([20+13, Y-2-10.5, 0]) cube([2, 10, 3]);
    }
    //window
    #translate([17, Y-2-10.5, -panel_thick2-gap1]) cube([15, 10, panel_thick2+gap2]);
    //screw
    translate([panel_thick, Y/2-8/2, -panel_thick2]) Mscrew();
    translate([X+panel_thick, Y/2+8/2, -panel_thick2]) rotate([0, 0, 180]) Mscrew();
}
}
if(C)
{
translate([8.5, 5.5, Z+panel_thick])
{
difference()
{
    union()
    {
        cylinder(8, d=10.5, $fn=100);
    }
    #translate([0, 0, -gap1]) cylinder(6, d=5.5, $fn=100);
    #translate([0, 0, -gap1]) cylinder(2, d=8.5, $fn=100);
}
}
}
if(D)
{
translate([(X+panel_thick*2)/2-8, (Y+panel_thick*2)/2, 18])
rotate([0, 0, 90])
{
difference()
{
    union()
    {
        translate([0, 0, 2+20/2]) cube([6.5, 5,20], center=true);
        translate([0, 1, 10]) rotate([15, 0, 0]) cube([20, 20, 5], center=true);
    }
    translate([-1.3/2, -5/2-gap1, 2-gap1]) cube([1.3, 5+gap2, 3.5]);
    translate([-5/2, -1.4/2, 2-gap1]) cube([5, 1.4, 3.5]);
    dai_gawa();
}
difference()
{
    dai();
    translate([0, 0, -gap1]) scale([0.9, 0.9, 0.8]) dai();
}
}
}


module dai()
{
    hull()
    {
        translate([0, 0.7, 11])
        rotate([2.5, 0, 0])
        {
            minkowski()
            {
                cube([12.5-2, 14-2, gap1], center=true);
                cylinder(gap1, d=2, $fn=100);
            }
        }
        translate([0, 0, 0])
        {
            minkowski()
            {
                cube([18-4, 18-4, gap1], center=true);
                cylinder(gap1, d=4, $fn=100);
            }
        }
    }
}
module dai_gawa()
{
    difference()
    {
        translate([-30/2, -30/2, 0]) cube([30, 30, 30]);
        translate([0, 0, -gap1])dai();
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

module Mscrew()
{
    translate([10/2, 8/2, 0]) cylinder(10, 1.6, 1.6, $fn=30);
    translate([10/2, 8/2, -gap1]) cylinder(2.2+0.3, 6/2, 6/2, $fn=30);
    translate([10/2, 8/2, 2.2+0.3-gap1]) cylinder(0.4, d1=6, d2=1.6*2, $fn=30);
}

module waku()
{
    difference()
    {
        union()
        {
            translate([(20+panel_thick*2)/2, (20+panel_thick*2)/2, 0]) rotate([0, 0, 45]) cylinder(8+panel_thick, d1=W1+panel_thick*2, d2=W2+panel_thick*2, $fn=4);
        }
        translate([(20+panel_thick*2)/2, (20+panel_thick*2)/2, panel_thick+gap1]) rotate([0, 0, 45]) cylinder(8, d1=W1, d2=W2, $fn=4);
    translate([(20+panel_thick*2)/2-key_pitch_x/2, (20+panel_thick*2)/2-key_pitch_y/2, -gap1]) cube([key_pitch_x, key_pitch_y, keybase_thick]);
    }
}