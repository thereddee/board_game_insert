
font1 = "Arial:style=Bold";
cardSpacer =10;


cardHeight = 3;

bigCardWidth = 66;
bigCardDepth = 91;

smallCardWidth = 44;
smallCardDepth = 66;

boardHeight = 5;
boardWidth = 255;
boardDepth = bigCardWidth*3+smallCardDepth*2+cardSpacer*6;

healthCube = 11;
healthSpacer = 3;

cut_right();
cut_left();



module cut_left() {
    difference() {
        color("red") cube([boardWidth,boardDepth/2,boardHeight]);
        
        color("blue") translate([boardWidth*0.75,  boardDepth/2]) linear_extrude(height = 5) rotate(90,0,0) circle(40,$fn=3);%circle(20,$fn=90);
    }   
        color("pink") translate([boardWidth*0.25,  boardDepth/2]) linear_extrude(height = 5) rotate(-90,0,0) circle(40,$fn=3);%circle(20,$fn=90);
}


module cut_right() {
    difference() {
        color("red") translate([0,boardDepth/2,0])cube([boardWidth,boardDepth/2,boardHeight]);
        //translate([0,0, -1]) cube([boardWidth,boardDepth/2,boardHeight+2]);
        rotate([0,180,0]) translate([-(boardWidth/2),  boardDepth*0.3, -boardHeight]) linear_extrude(height = 5) circle(40,$fn=3);%circle(20,$fn=90);
        color("pink") translate([boardWidth*0.25,  boardDepth/2]) linear_extrude(height = 5) rotate(-90,0,0) circle(40,$fn=3);%circle(20,$fn=90);
    }
    color("blue") translate([boardWidth*0.75,  boardDepth/2]) linear_extrude(height = 5) rotate(90,0,0) circle(40,$fn=3);%circle(20,$fn=90);
}

            