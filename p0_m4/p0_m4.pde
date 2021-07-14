int square = 50;
int addition = 0;
float thetaAddition = 0;
int width = 800;
int height = 400;

PVector redSquare = new PVector((width / 2) - (square / 2), 0);
PVector blueSquare = new PVector(0, (height / 2) - (square / 2));
PVector leftRightSquare = new PVector(width - 200, 20);
PVector pendulumSquare = new PVector(width - 100, 20);
PVector animationSquare = new PVector(80, 25);

String spaceBar = "Press the space bar to reverse the blue rectangles movement";
String upArrow = "Press the up arrow to slowly move the blue rectangle up";
String downArrow = "Press the down arrow to slowly move the blue rectangle down";
String clickBlueRect = "Click the blue rectangle to pause the animation. Click it again to resume.";
String clickAnywhere = "Click the screen anywhere will move the blue rectangle to that height";

Boolean spaceBarPressed = false;
int upArrowPressed = 1;
int downArrowPressed = -1;
Boolean blueRectClicked = false;

Boolean pendulumAnimation = false;
Boolean reversePendulum = false;
float theta = -PI/4;

void setup() {
  //size of canvas 
  size(800, 400);
}

void draw() {
  //Color in the canvas background
  background(255, 255, 255);
  
  fill(0, 0, 255);
  rect(width - 200, 20, animationSquare.x, animationSquare.y);
  fill(255, 255, 255);
  text("left-right", width-185, 37);
  
  fill(0, 0, 255);
  rect(width - 100, 20, animationSquare.x, animationSquare.y);
  fill(255, 255, 255);
  text("pendulum", width-90, 37);  
  
  if(pendulumAnimation)
    pendulum();
  else  
    leftRight();
}

void leftRight() {
  fill(0);
  textSize(12);
  text(spaceBar, 10, 20);
  text(upArrow, 10, 20*2);
  text(downArrow, 10, 20*3);
  text(clickBlueRect, 10, 20*4);
  text(clickAnywhere, 10, 20*5);
  
  
  if(!blueRectClicked) {
    blueSquare.x += addition;
    
    if(blueSquare.x == 0)
      addition = 1;
    else if(blueSquare.x+square == width)
      addition = -1;
  }
    
  line(redSquare.x+(square/2), redSquare.y+(square/2), blueSquare.x+(square/2), blueSquare.y+(square/2));

  fill(255, 0, 0);
  rect(redSquare.x, redSquare.y, square, square);

  fill(0, 0, 255);
  rect(blueSquare.x, blueSquare.y, square, square);
}

void pendulum() {
  int lengthOfString = 300;
  PVector bluePendulumSquare = new PVector(redSquare.x + lengthOfString*sin(theta), redSquare.y + lengthOfString*cos(theta));
  
  line(redSquare.x+(square/2), redSquare.y+(square/2), bluePendulumSquare.x+(square/2), bluePendulumSquare.y+(square/2));

  fill(255, 0, 0);
  rect(redSquare.x, redSquare.y, square, square);

  fill(0, 0, 255);
  rect(bluePendulumSquare.x, bluePendulumSquare.y, square, square);
  
  fill(0, 0, 0);
  text("X :" + bluePendulumSquare.x , bluePendulumSquare.x-15, bluePendulumSquare.y + square+20); 
  text("Y :" + bluePendulumSquare.y , bluePendulumSquare.x-15, bluePendulumSquare.y + square+35); 


  theta += thetaAddition;

  if(theta < -PI/4)
    reversePendulum = true;
  else if (theta > PI/4)
    reversePendulum = false;
 
  if(reversePendulum)
    thetaAddition = 0.01;
  else
    thetaAddition = -0.01;
}

void mousePressed() {
  if ((mouseX > blueSquare.x) && (mouseX < (blueSquare.x + square)) 
    && (mouseY > blueSquare.y) && (mouseY < (blueSquare.y + square))) {
    blueRectClicked = !blueRectClicked;
  } else {
    blueSquare.y = mouseY - (square/2);
  }
  
  if ((mouseX > leftRightSquare.x) && (mouseX < leftRightSquare.x + animationSquare.x) 
    && (mouseY > leftRightSquare.y) && (mouseY < (leftRightSquare.y + animationSquare.y))) {
    pendulumAnimation = false;
  } else if ((mouseX > pendulumSquare.x) && (mouseX < pendulumSquare.x + animationSquare.x) 
    && (mouseY > pendulumSquare.y) && (mouseY < (pendulumSquare.y + animationSquare.y))) {
    pendulumAnimation = true;
  }
}

void keyPressed() {
  if (keyCode == 32) {
    addition *= -1;
  } else if (keyCode == 38) {
    blueSquare.y -= 5;
  } else if (keyCode == 40) {
    blueSquare.y += 5;
  }
}
