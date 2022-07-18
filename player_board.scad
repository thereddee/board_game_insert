
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

    translate ([220, boardDepth/2, 2.5]) {
        rotate ([0,0,270]) {
            linear_extrude(height = 3) {
                text(characterName, font = font1, size = 20, direction = "ltr", spacing = 1, halign = "center" );
            }
        }
    }

translate ([220, 400, 9]) rotate ([90, 0,0]) linear_extrude(height = 3) text("Hello", font = font1, size = 14, direction = "ltr", spacing = 1);

    
    translate ([88, 147, 2.5]) bLabel("MAX HEALTH", 8);
    translate ([40, 147, 2.5]) bLabel("CURRENT HEALTH", 8);
    for(i = [0:1:9]) {
      healthCube(cardSpacer, cardSpacer+(healthCube+healthSpacer)*i, str(9-i));
      healthCube(cardSpacer+healthCube+healthSpacer, cardSpacer+(healthCube+healthSpacer)*i,str(9-i));
      healthCube(47+cardSpacer, cardSpacer+(healthCube+healthSpacer)*i, str(9-i));
      healthCube(47+cardSpacer+healthCube+healthSpacer, cardSpacer+(healthCube+healthSpacer)*i, str(9-i));
    } 
    
    spaceX1 = cardSpacer;
    small_card(158,spaceX1, "DICES");
    small_card(158-(cardSpacer*1+smallCardWidth*1),spaceX1, "DICES");
    
    spaceX2 = smallCardDepth+(smallCardDepth*3)+(5*cardSpacer);
    small_card(158, spaceX2, "PASSIVES");
    small_card(158-(cardSpacer*1+smallCardWidth*1),spaceX2, "PASSIVES");
    small_card(158-(cardSpacer*2+smallCardWidth*2), spaceX2, "PASSIVES");
    echo(smallCardDepth+(smallCardDepth*2)+(2*cardSpacer));
    spaceY1 = cardSpacer;
    big_card(spaceY1, smallCardDepth+(smallCardDepth*1)+(3*cardSpacer), "CLASS ");
    big_card(spaceY1, smallCardDepth+(smallCardDepth*2)+(4*cardSpacer), "CLASS");
    translate ([cardSpacer+bigCardDepth-24, 223, 1]) bLabel("FEATURE", 7);
    spaceY2 = cardSpacer*2+bigCardDepth;
    big_card(spaceY2, smallCardDepth+(2*cardSpacer), "ACCESSORY");
    big_card(spaceY2, smallCardDepth+(smallCardDepth*1)+(3*cardSpacer), "ARMOR");
    big_card(spaceY2, smallCardDepth+(smallCardDepth*2)+(4*cardSpacer), "WEAPON");
}



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