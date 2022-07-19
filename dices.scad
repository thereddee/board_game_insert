/* [Box Parameters] */


boxWidth = 38;
boxDepth = 145;
boxHeight = 27;
cylinderHeight = 35;
wallThick = 1.5;


difference() {
    cube([boxWidth,boxDepth,boxHeight]);
    color("pink") translate([wallThick, wallThick, wallThick]) cube([boxWidth-(wallThick*2),boxDepth-wallThick*2,boxHeight]);
}


