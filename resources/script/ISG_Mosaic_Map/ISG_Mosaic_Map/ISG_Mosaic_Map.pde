PImage portrait;
PImage test;
int pxWidth, pxNum;
int x_width = 800;


void settings() {

  //size((x_width*9)/16, x_width);
  //size((displayHeight*9)/16, displayHeight);
  fullScreen();
}

void setup() {
  //size(563,1000);
  //pxNum = 150;
  //pxWidth = width/pxNum;

  portrait = loadImage("./resources/script/ISG_Mosaic_Map/ISG_Mosaic_Map/resources/images/GardnerPortrait-16by9.jpg");
  //image(portrait, 0,0, (height*9)/16, height);
  /**
  for (int x=0; x<width; x+=pxWidth){
    for (int y=0; y<height; y+=pxWidth){
      noStroke();
      color c = get(x,y);
      fill(c);
      //fill(#dff442, 200);
      rect(x, y, pxWidth, pxWidth);
    }
  }
 **/ 
  test = loadImage("output/result0.jpg");
  //blend(test, 0, 0, width, height, 0, 0, width, height, OVERLAY);
  //BLEND, ADD, SUBTRACT, LIGHTEST, DARKEST, DIFFERENCE, 
  //EXCLUSION, MULTIPLY, SCREEN, OVERLAY, HARD_LIGHT, SOFT_LIGHT, DODGE, BURN

}

void draw() {
  
  pxNum = (mouseX+12)/6;
  pxWidth = width/pxNum;
  //println(pxNum);
  //println(height/pxWidth);
  println(pxNum*(height/pxWidth));

  image(portrait, 0,0, (height*9)/16, height);
  
  for (int x=0; x<width; x+=pxWidth){
    for (int y=0; y<height; y+=pxWidth){
      noStroke();
      color c = get(x,y);
      fill(c);
      //fill(#dff442, 200);
      rect(x, y, pxWidth, pxWidth);
    }
  }
  
  blend(test, 0, 0, width, height, 0, 0, width, height, OVERLAY);

}