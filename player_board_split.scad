
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

characterName =  "ROBERTA"; // Roberta Tolben Quill Olette Elwyn
        difference() {
            cube([boardWidth,boardDepth,boardHeight]);
            translate([0,0, -1]) cube([boardWidth/2,boardDepth,boardHeight+2]);
            rotate([0,180,0]) translate([-(boardWidth/2),  boardDepth*0.6, -boardHeight]) linear_extrude(height = 5) circle(40,$fn=3);%circle(20,$fn=90);
        }
        translate([boardWidth/2,  boardDepth*0.3]) linear_extrude(height = 5) circle(40,$fn=3);%circle(20,$fn=90);



            
module small_card(px, py, content) {
    translate([px, py, 3]) cube([smallCardWidth, smallCardDepth, cardHeight]);
    translate ([px+smallCardWidth-13, py+smallCardDepth-4, 1]) bLabel(content, 7);
}

module big_card(px, py, content) {
    translate([px, py, 3]) rotate([0,0, 0]) cube([bigCardDepth, bigCardWidth,cardHeight]);
    translate ([px+bigCardDepth-13, py+smallCardDepth-4, 1]) bLabel(content, 7);
}
module healthCube(px, py, content) {
    color("green") translate([px, py, 2]) rotate([0,0, 0]) cube([healthCube, healthCube,4]);
    color("black") translate ([px+2, py+healthSpacer+5, 1]) {
        rotate ([0,0,270]) {
            linear_extrude(height = 5) {
                text(content, font = font1, size = 6, direction = "ltr" );
            }
        }
    }
}
module bLabel(label, font_size) {
    rotate ([0,0,270]) {
        linear_extrude(height = 3) {
            text(label, font = font1, size = font_size, direction = "ltr" );
        }
    }
}