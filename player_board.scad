


cardSpacer =10;


cardHeight = 2;

bigCardWidth = 66;
bigCardDepth = 91;

smallCardWidth = 44;
smallCardDepth = 66;

boardHeight = 5;
boardWidth = 215;
boardDepth = bigCardWidth*3+smallCardDepth*2+cardSpacer*6;

healthCube = 9;
healthSpacer = 3;

//diff() {
cube([boardWidth,boardDepth,boardHeight]);

spaceX1 = cardSpacer;
small_card(158,spaceX1);
small_card(158-(cardSpacer*1+smallCardWidth*1),spaceX1);
//small_card(158-(cardSpacer*2+smallCardWidth*2),spaceX1);

spaceX2 = smallCardDepth+(smallCardDepth*3)+(5*cardSpacer);
small_card(158, spaceX2);
small_card(158-(cardSpacer*1+smallCardWidth*1),spaceX2);
small_card(158-(cardSpacer*2+smallCardWidth*2), spaceX2);

spaceY1 = cardSpacer;
//big_card(spaceY1, smallCardDepth+(2*cardSpacer));
big_card(spaceY1, smallCardDepth+(smallCardDepth*1)+(3*cardSpacer));
big_card(spaceY1, smallCardDepth+(smallCardDepth*2)+(4*cardSpacer));

spaceY2 = cardSpacer*2+bigCardDepth;
big_card(spaceY2, smallCardDepth+(2*cardSpacer));
big_card(spaceY2, smallCardDepth+(smallCardDepth*1)+(3*cardSpacer));
big_card(spaceY2, smallCardDepth+(smallCardDepth*2)+(4*cardSpacer));

for(i = [0:1:10]) {
  health_cube(cardSpacer, cardSpacer+(healthCube+healthSpacer)*i);
  health_cube(cardSpacer+healthCube+healthSpacer, cardSpacer+(healthCube+healthSpacer)*i);
    
    
    
  health_cube(40+cardSpacer, cardSpacer+(healthCube+healthSpacer)*i);
  health_cube(40+cardSpacer+healthCube+healthSpacer, cardSpacer+(healthCube+healthSpacer)*i);
  //health_cube(cardSpacer, cardSpacer+(healthCube+healthSpacer)*i);
  //health_cube(cardSpacer, cardSpacer+(healthCube+healthSpacer)*i);
} 

    
//}


module small_card(px, py) {
    color("blue") translate([px, py, 10]) cube([smallCardWidth, smallCardDepth, cardHeight]);
}
module big_card(px, py) {
    color("red") translate([px, py, 10]) rotate([0,0, 0]) cube([bigCardDepth, bigCardWidth,cardHeight]);
}
module health_cube(px, py) {
    color("green") translate([px, py, 10]) rotate([0,0, 0]) cube([healthCube, healthCube,cardHeight]);
}