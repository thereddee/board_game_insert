/* [Box Parameters] */


innerWidth = 95;
innerDepth = 145;
innerHeight = 80;

wallThick = 1.5;
totalWidth = innerWidth + (wallThick*2);
cutoutHeight = 30;
cutoutWidth = 45;

cutoutOffsetX = ((wallThick * 2) + innerWidth) / 2 - (cutoutWidth / 2);
cutoutOffsetZ = wallThick + innerHeight - cutoutHeight;

difference() {
    cube([innerWidth + (wallThick * 2),innerDepth + (wallThick * 2),innerHeight + wallThick]);
    translate([wallThick,wallThick,wallThick]) cube([innerWidth,innerDepth,innerHeight + 3]);
    translate([cutoutOffsetX,-1,cutoutOffsetZ]) cube([cutoutWidth,wallThick * 4 + innerDepth,cutoutHeight + 3]);

    translate([cutoutOffsetX,0,innerHeight+wallThick]) rotate([270,90,0])fillet(10,5);

    translate([cutoutOffsetX,innerDepth + wallThick,innerHeight+wallThick]) rotate([270,90,0])fillet(10,5);

    translate([innerWidth+wallThick*2-cutoutOffsetX,0,innerHeight+wallThick]) rotate([90,90,0])fillet(10,5);

    translate([innerWidth+wallThick*2-cutoutOffsetX,innerDepth + wallThick,innerHeight+wallThick]) rotate([90,90,0])fillet(10,5);
    for(i = [12:15:innerDepth-10]) {
        ident(i);
    } 

    color("blue") translate([(innerWidth+(wallThick * 2))/2,150,cutoutOffsetZ])  rotate ([90, 0,0]) cylinder(h=155, r=22.5);
}
  

module fillet(r, h) {
    translate([r / 2, r / 2, 0])

        difference() {
            cube([r + 0.01, r + 0.01, h], center = true);

            translate([r/2, r/2, 0])
                cylinder(r = r, h = h + 1, center = true);

        }
}

module ident (y) {
    translate([3,y,62]) rotate([0,0,90]) cube([2.5, 6.5, 20]);
    translate([100,y,62]) rotate([0,0,90]) cube([2.5, 6.5, 20]);

    
}
