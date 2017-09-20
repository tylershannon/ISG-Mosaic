//initialize variables
var portrait;

function preload(){
  portrait = loadImage("./resources/images/portrait/portrait_cropped_16_9.jpg");
}

function setup() {
  createCanvas((windowHeight*9)/16, windowHeight);
  background('#393f93');
  image(portrait, 0,0, (windowHeight*9)/16, windowHeight);
  println(1);

}

function draw() {

}
