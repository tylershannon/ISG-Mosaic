PImage portrait;
PImage test;
int pxWidth, pxNum;
int x_width = 800;
String mode = "web"; //"IDE" "web"

//void settings() {

  //size((x_width*9)/16, x_width);
  //size((displayHeight*9)/16, displayHeight);
//}

void setup() {
  size(675,1200);
  //pxNum = 150;
  //pxWidth = width/pxNum;
  
  if (mode == "web"){
    portrait = loadImage("./resources/script/ISG_Mosaic_Map/ISG_Mosaic_Map/resources/images/GardnerPortrait-16by9.jpg");
  }
  if (mode == "IDE") {
     portrait = loadImage("./resources/images/GardnerPortrait-16by9.jpg");
  }
  
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
  
  if (mode == "web") {
    test = loadImage("./resources/script/ISG_Mosaic_Map/ISG_Mosaic_Map/output/result0.jpg");
  }
  if (mode == "IDE") {
    test = loadImage("./output/result0.jpg");
  }
  
  //blend(test, 0, 0, width, height, 0, 0, width, height, OVERLAY);
  //BLEND, ADD, SUBTRACT, LIGHTEST, DARKEST, DIFFERENCE, 
  //EXCLUSION, MULTIPLY, SCREEN, OVERLAY, HARD_LIGHT, SOFT_LIGHT, DODGE, BURN

}

void draw() {
  
  pxNum = 20;
  pxWidth = width/pxNum;
  //println(pxNum);
  //println(height/pxWidth);
  //println(pxNum*(height/pxWidth));

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