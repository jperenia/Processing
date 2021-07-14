int square = 50;
int addition = 0;
int width = 800;
int height = 400;

int redSquareX = (width / 2) - (square / 2);
int redSquareY = 0;

int blueSquareX = 0;
int blueSquareY = (height / 2) - (square / 2);

String spaceBar = "Press the space bar to reverse the blue rectangles movement";
String upArrow = "Press the up arrow to slowly move the blue rectangle up";
String downArrow = "Press the down arrow to slowly move the blue rectangle down";
String clickBlueRect = "Click the blue rectangle to pause the animation. Click it again to resume.";
String clickAnywhere = "Click the screen anywhere will move the blue rectangle to that height";

Boolean spaceBarPressed = false;
int upArrowPressed = 1;
int downArrowPressed = -1;
Boolean blueRectClicked = false;
Boolean anywhereClicked = false;

void setup() {
  //size of canvas 
  size(800, 400);
}

void draw() {
  //Color in the canvas background
  background(255, 255, 255);
  
  fill(0);
  textSize(12);
  text(spaceBar, 10, 20);
  text(upArrow, 10, 20*2);
  text(downArrow, 10, 20*3);
  text(clickBlueRect, 10, 20*4);
  text(clickAnywhere, 10, 20*5);
  
  
  if(!blueRectClicked) {
    blueSquareX += addition;
    
    if(blueSquareX == 0)
      addition = 1;
    else if(blueSquareX+square == width)
      addition = -1;
  }
    
  line(redSquareX+(square/2), redSquareY+(square/2), blueSquareX+(square/2), blueSquareY+(square/2));

  fill(255, 0, 0);
  rect(redSquareX, redSquareY, square, square);

  fill(0, 0, 255);
  rect(blueSquareX, blueSquareY, square, square);
}

void mousePressed() {
  if ((mouseX > blueSquareX) && (mouseX < (blueSquareX + square)) && (mouseY > blueSquareY) && (mouseY < (blueSquareY + square))) {
    blueRectClicked = !blueRectClicked;
  } else {
    blueSquareY = mouseY - (square/2);
  }
}

void keyPressed() {
  if (keyCode == 32) {
    addition *= -1;
  } else if (keyCode == 38) {
    blueSquareY -= 5;
  } else if (keyCode == 40) {
    blueSquareY += 5;
  }
}
