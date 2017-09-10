PImage portrait;
PImage test;
int pxWidth, pxNum;
String mode = "IDE"; //"IDE" "web"

void settings () {
  size((displayHeight*9)/16, displayHeight);
}

void setup() {
  //size(787,1400);

  if (mode == "web"){
    portrait = loadImage("./resources/script/ISG_Mosaic_Map/ISG_Mosaic_Map/resources/images/GardnerPortrait-16by9.jpg");
  }
  if (mode == "IDE") {
     portrait = loadImage("./resources/images/GardnerPortrait-16by9.jpg");
  }
  /**
  if (mode == "web") {
    test = loadImage("./resources/script/ISG_Mosaic_Map/ISG_Mosaic_Map/output/result0.jpg");
  }
  if (mode == "IDE") {
    test = loadImage("./output/result0.jpg");
  }
  **/
  
// render image to canvas
  pxNum = 80;
  pxWidth = width/pxNum;
  //println(pxNum);
  //println(height/pxWidth);
  //println(pxNum*(height/pxWidth));
  
  image(portrait, 0,0, width, height);

  //blend(test, 0, 0, width, height, 0, 0, width, height, OVERLAY);

}

void draw() {
    for (int x=0; x<width; x+=pxWidth){
    for (int y=0; y<height; y+=pxWidth){
      noStroke();
      color c = get(x,y);
      fill(c);
      //fill(#dff442, 200);
      rect(x, y, pxWidth, pxWidth);
    }
  }
}