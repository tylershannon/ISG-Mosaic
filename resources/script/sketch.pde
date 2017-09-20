void setup() {
  size(600, 600);
  background(0);
  PImage imgWeb = loadImage("./resources/images/portrait/portrait_cropped_16_9.jpg");
  image(imgWeb, 0,0,600,600);
  //PImage imgIDE = loadImage("./data/portrait_cropped_16_9.jpg");
  //image(imgIDE, 0,0,600,600);
}
