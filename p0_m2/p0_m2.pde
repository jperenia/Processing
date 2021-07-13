int square = 50;
int addition = 0;
int width = 800;
int height = 400;

int redSquareX = (width / 2) - (square / 2);
int redSquareY = 0;

int blueSquareX = 0;
int blueSquareY = (height / 2) - (square / 2);

void setup() {
  //size of canvas 
  size(800, 400);
}

void draw() {
  //Color in the canvas background
  background(255, 255, 255);
  
  blueSquareX += addition;
  
  if(blueSquareX == 0)
    addition = 1;
  else if(blueSquareX+square == width)
    addition = -1;
  
  line(redSquareX+(square/2), redSquareY+(square/2), blueSquareX+(square/2), blueSquareY+(square/2));

  fill(255, 0, 0);
  rect(redSquareX, redSquareY, square, square);

  fill(0, 0, 255);
  rect(blueSquareX, blueSquareY, square, square);
}
