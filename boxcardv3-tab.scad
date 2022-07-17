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
/*
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
  */

   //color("blue") translate([-5,2,60]) cube([105,60,120]);  
//    cube([innerWidth + (wallThick * 2),innerDepth + (wallThick * 2),innerHeight + wallThick]);
//anslate([wallThick,wallThick,wallThick]) cube([innerWidth,innerDepth,innerHeight + 3]);
 difference() {
    translate([-2,6   , 3])color("red") cube([innerWidth + (wallThick * 2)+4,wallThick,innerHeight - wallThick]);


    color("green") rotate ([90, 0,0]) translate([-5,70,-20]) cube([120, 20, 38]);    
    color("blue") translate([cutoutOffsetX+1,-1.5,cutoutOffsetZ-5]) cube([cutoutWidth,wallThick * 4 + innerDepth,cutoutHeight + 3]);
    color("blue") translate([(innerWidth+(wallThick * 2))/2+1,8,cutoutOffsetZ-4])  rotate ([90, 0,0]) cylinder(h=155, r=22.5);
    color("pink")  rotate ([90, 0,0]) translate([-2.1,0,-20]) cube([2,  59, 38]);
    color("pink")  rotate ([90, 0,0]) translate([98.1,0,-20]) cube([2,  59, 38]);
    color("green") rotate ([90, 0,0]) translate([-0.1,0,-20]) cube([2, 63, 38]);
    color("green") rotate ([90, 0,0]) translate([96.1,0,-20]) cube([2, 63, 38]);

}

/*
font1 = "Liberation Sans"; // here you can select other font type
content = "Bosses";
translate ([totalWidth/2,-1,30]) {
    rotate ([90, 0,0]) {
        //linear_extrude(height = 1.5) {
            text(content, font = font1, size = 20, direction = "ltr", spacing = 1, halign = "center" );
        //}
    }
}
*/
 
    //translate([innerWidth+(wallThick*2),20,innerHeight-28]) rotate([0,0,90]) scale([4,2,20]) cube(wallThick);
    //translate([wallThick+1,20,innerHeight-28]) rotate([0,0,90]) scale([4,2,20]) cube(wallThick);
   // translate([wallThick,20,innerHeight]) rotate([0,0,90]) scale([0.5,1,2]) cube(wallThick);

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
