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
  size(900,1600);
  
  if (mode == "web"){
    portrait = loadImage("./resources/script/ISG_Mosaic_Map/ISG_Mosaic_Map/resources/images/GardnerPortrait-16by9.jpg");
  }
  if (mode == "IDE") {
     portrait = loadImage("./resources/images/GardnerPortrait-16by9.jpg");
  }
  
  if (mode == "web") {
    test = loadImage("./resources/script/ISG_Mosaic_Map/ISG_Mosaic_Map/output/result0.jpg");
  }
  if (mode == "IDE") {
    test = loadImage("./output/result0.jpg");
  }
// render image to canvas
  pxNum = 30;
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

void draw() {
  noLoop();
}