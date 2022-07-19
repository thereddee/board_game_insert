
font1 = "Arial:style=Bold";
cardSpacer =5;


cardHeight = 3;

bigCardWidth = 66;
bigCardDepth = 91;

smallCardWidth = 44;
smallCardDepth = 66;

boardHeight = 5;
boardWidth = 210;
boardDepth = bigCardWidth*3+smallCardDepth*2+cardSpacer*6;
echo(boardDepth);
healthCube = 11;
healthSpacer = 3;

characterName =  "ROBERTA"; // Roberta Tolben Quill Olette Elwyn
difference() {
    cube([boardWidth,boardDepth,boardHeight]);

    translate ([195, boardDepth/2, 2.5]) {
        rotate ([0,0,270]) {
            linear_extrude(height = 3) {
                text(characterName, font = font1, size = 9, direction = "ltr", spacing = 1, halign = "center" );
            }
        }
    }

    translate ([220, 400, 9]) rotate ([90, 0,0]) linear_extrude(height = 3) text("Hello", font = font1, size = 14, direction = "ltr", spacing = 1);

    
    translate ([83, 142, 2.5]) bLabel("MAX HEALTH", 7);
    translate ([35, 142, 2.5]) bLabel("CURRENT HEALTH", 7);
    for(i = [0:1:9]) {
      healthCube(cardSpacer, cardSpacer+(healthCube+healthSpacer)*i, str(9-i));
      healthCube(cardSpacer+healthCube+healthSpacer, cardSpacer+(healthCube+healthSpacer)*i,str(9-i));
      healthCube(47+cardSpacer, cardSpacer+(healthCube+healthSpacer)*i, str(9-i));
      healthCube(47+cardSpacer+healthCube+healthSpacer, cardSpacer+(healthCube+healthSpacer)*i, str(9-i));
    } 
    
    // Dices Cards
    spaceX1 = cardSpacer;
    small_card(148,spaceX1, "DICES");
    translate([148+13, 0, 0]) cylinder(h=20, r=10, center=true);

    small_card(148-(cardSpacer*1+smallCardWidth*1),spaceX1, "DICES");
    translate([148+13-(cardSpacer*1+smallCardWidth*1), 0, 0]) cylinder(h=20, r=10, center=true);
    
    
    // Pasives Cards
    spaceX2 = smallCardDepth+(smallCardDepth*3)+(5*cardSpacer);
    small_card(148, spaceX2, "PASSIVES");
    translate([148+13, boardDepth, 0]) cylinder(h=20, r=10, center=true);
    
    small_card(148-(cardSpacer*1+smallCardWidth*1),spaceX2, "PASSIVES");
    translate([148+13-(cardSpacer*1+smallCardWidth*1), boardDepth, 0]) cylinder(h=20, r=10, center=true);
    
    small_card(148-(cardSpacer*2+smallCardWidth*2), spaceX2, "PASSIVES");
    translate([148+13-(cardSpacer*2+smallCardWidth*2), boardDepth, 0]) cylinder(h=20, r=10, center=true);
    
    
    
    echo(smallCardDepth+(smallCardDepth*2)+(2*cardSpacer));
    spaceY1 = cardSpacer;
    big_card(spaceY1, smallCardDepth+(smallCardDepth*1)+(3*cardSpacer), "CLASS ");
    big_card(spaceY1, smallCardDepth+(smallCardDepth*2)+(4*cardSpacer), "CLASS");
    translate ([cardSpacer+bigCardDepth-24, 208, 1]) bLabel("FEATURE", 7);
    
    //translate([140, 215, 0]) cylinder(h=20, r=10, center=true);
    translate([cardSpacer+bigCardDepth*0.5, cardSpacer*3.5+smallCardDepth+bigCardWidth*2, 0]) cylinder(h=20, r=10, center=true);
    translate([cardSpacer*2+bigCardDepth*1.5, cardSpacer*3.5+smallCardDepth+bigCardWidth*2, 0]) cylinder(h=20, r=10, center=true);
    translate([cardSpacer*2+bigCardDepth*1.5, cardSpacer*2.5+smallCardDepth+bigCardWidth, 0]) cylinder(h=20, r=10, center=true);
    //translate([148, 215, 0]) cylinder(h=20, r=10, center=true);
    
    spaceY2 = cardSpacer*2+bigCardDepth;
    big_card(spaceY2, smallCardDepth+(2*cardSpacer), "ACCESSORY");
    big_card(spaceY2, smallCardDepth+(smallCardDepth*1)+(3*cardSpacer), "ARMOR");
    big_card(spaceY2, smallCardDepth+(smallCardDepth*2)+(4*cardSpacer), "WEAPON");
    
    
    cut_left();
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
