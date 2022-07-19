/* [Box Parameters] */


boxWidth = 38;
boxDepth = 145;
boxHeight = 27;
cylinderHeight = 35;
wallThick = 1.5;


difference() {
    cube([boxWidth,boxDepth,boxHeight]);
    color("blue") scale([1,1,1.4]) translate([boxWidth/2, boxDepth-wallThick , boxHeight/1.4])
    rotate ([90, 0,0]) cylinder(h=boxDepth/2-wallThick*2, d=boxWidth-wallThick*2);
    color("pink") translate([wallThick, wallThick, wallThick]) cube([boxWidth-(wallThick*2),boxDepth/2-wallThick,boxHeight]);
}
color("red") translate([0, boxDepth/4*2, 0]) cube([boxWidth,wallThick,boxHeight]);

