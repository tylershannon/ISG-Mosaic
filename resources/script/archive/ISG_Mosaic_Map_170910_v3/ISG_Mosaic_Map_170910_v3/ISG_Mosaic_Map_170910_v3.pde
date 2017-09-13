PImage portrait;
PImage test;
int pxWidth, pxNum, offset, x_counter, y_counter, image_loop;
int[] placement_x, placement_y;
String mode = "IDE"; //"IDE" "web"
int currentFrame=0;
int numFrames = 700;
PImage[] images = new PImage[numFrames];
JSONObject instagram;
JSONArray post;
PImage img_get, img_proxy, img_render;
String api = "https://app.dialogfeed.com/en/snippet/isg-display.json?api_key=e2e57b8f7cec6a72dcff7db8ad977dea&since_id=10000";
String url1, url_proxy;


void settings () {
  size((displayHeight*9)/16, displayHeight);
}

void setup() {
  //size(787,1400);
  pxNum = 20;
  pxWidth = width/pxNum;

  if (mode == "web"){
    portrait = loadImage("./resources/images/portrait/portrait_cropped_16_9.jpg");
  }
  if (mode == "IDE") {
     portrait = loadImage("./resources/images/portrait_cropped_16_9.jpg");
  }
  
// RENDER PIXEL COLOR TO CANVAS
  image(portrait, 0,0, width, height);
  
  for (int x=0; x<width; x+=pxWidth){
    for (int y=0; y<height; y+=pxWidth){
      noStroke();
      color c = portrait.get(x,y);
      fill(c);
      //fill(#dff442, 200);
      rect(x, y, pxWidth, pxWidth);
    }
  }
  
// CREATE ARRAY OF COORDINATES FOR PLACEMENT
  placement_x = new int[width/pxWidth];
  placement_y = new int[height/pxWidth];
  
  for (int i = 1; i < (placement_x.length+1); i++) {
    placement_x[i-1] = i;
  }
  for (int i = 1; i < (placement_y.length+1); i++) {
  placement_y[i-1] = i;
  }
  
// LOOP SETUP
  currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
  offset = 0;
  x_counter = 0;
  y_counter = 0;
  image_loop = 0;  
  
  for (int i=0; i < numFrames; i++) {
    String imageName = "output/result"+i+".jpg";
    images[i] = loadImage(imageName);
    color c = get(pxWidth*x_counter, pxWidth*y_counter);
    tint(c);
    image(images[image_loop], pxWidth*x_counter, pxWidth*y_counter, pxWidth, pxWidth);

    if (x_counter < placement_x.length-1) {
      x_counter +=1;
    } else {
      x_counter = 0;
      y_counter +=1;
    }
    if (image_loop < numFrames) {
      image_loop +=1;
    } else {
      image_loop = 0;
    }
  }
}

void draw() {
  
  //accessAPI(api, numFrames);
  int newImage_index = int(random(0,700));
  int newImage_xLoc = pxWidth*int(random(0, pxNum));
  int newImage_yLoc = pxWidth*int(random(0, (height/pxWidth)));
  color c = portrait.get(newImage_xLoc, newImage_yLoc);
  tint(c);
  image(images[newImage_index], newImage_xLoc, newImage_yLoc, pxWidth, pxWidth);
  
}


// define functions
void accessAPI(String api_address, int save_start) {
  instagram = loadJSONObject(api_address);
  post = instagram.getJSONObject("news_feed").getJSONObject("posts").getJSONArray("post");
  JSONObject posts = instagram.getJSONObject("news_feed");
  //println(posts);

  for (int i=0; i<post.size(); i++){
    try {
      url1 = post.getJSONObject(i).getJSONObject("content").getString("content_picture");
      img_get = loadImage(url1);
      img_get.save("output/result"+(save_start+i)+".jpg");
    }
    catch(Exception e){
      url_proxy = "https://scontent.cdninstagram.com/t51.2885-15/s640x640/sh0.08/e35/21297053_294573284282726_1278537083127857152_n.jpg";
      img_proxy = loadImage(url_proxy);
      img_proxy.save("output/result"+(save_start+i)+".jpg");
    }
  }
}