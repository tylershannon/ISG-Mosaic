//initialize variables
var portrait;
var pxWidth;
var pxCount_width;
var displayWidth
var displayHeight

function preload(){
  portrait = loadImage("./resources/images/portrait/portrait_cropped_16_9.jpg");
}

function setup() {
  displayHeight = windowHeight;
  displayWidth = (windowHeight*9)/16
  createCanvas((windowHeight*9)/16, displayHeight);
  background('#393f93');
  image(portrait, 0,0, displayWidth, windowHeight);
  console.log(2);
  pxCount_width = 80;
  pxWidth = displayWidth/pxCount_width;
  console.log(pxWidth);

}

function draw() {

}
