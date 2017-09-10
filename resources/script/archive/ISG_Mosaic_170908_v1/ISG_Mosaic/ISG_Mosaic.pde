/** 
ISABELLA STEWART GARNDER INSTAGRAM MOSAIC DISPLAY

project documentation section tbc

**/



// -------------  INITIALIZE PARAMETERS AND VARIABLES  -------------
//--------------------------------------------------------------------------------------------------------
int random_index, random_x, random_y, insta_size, insta_countx, image_loop, x_counter, y_counter, offset;
int currentFrame = 0;
int numFrames = 106;
PImage img_get, img_proxy, img_render;
PImage[] images = new PImage[numFrames];
String url1, url_proxy;
JSONObject instagram;
JSONArray post;
PFont fontBold, fontLight;
int[] fileNumber;
int[] placement_x;
int[] placement_y;
String api = "https://app.dialogfeed.com/en/snippet/isg-display.json?api_key=e2e57b8f7cec6a72dcff7db8ad977dea";


void settings() {
// -------------  DEFINE CANVAS PARAMETERS  -------------
//--------------------------------------------------------------------------------------------------------
  size((displayHeight*9)/16, displayHeight);
}

void setup () {
// -------------  RESOLUTION OF MOSAIC  -------------
// -------------  increase count for higher resolution  -------------
//--------------------------------------------------------------------------------------------------------
  insta_countx = 7; //max 7
  insta_size = width/insta_countx;
// -------------  SETUP BACKGROUND ENVIRONMENT  -------------
//--------------------------------------------------------------------------------------------------------
  background(#393f93);
  fill(255);
  fontBold = createFont("Futura-Bold", 40);
  fontLight = createFont("TimesNewRomanPSMT", 25);
  textFont(fontBold);
  textAlign(CENTER, CENTER);
// -------------  BACKGROUND TEXT SECTION  -------------
//--------------------------------------------------------------------------------------------------------
  text("HENRY JAMES AND", width/2, height/2-(45*3));
  text("AMERICAN PAINTING", width/2, height/2-(40*2));
  textFont(fontLight);
  text("#isgmosaic", width/2, height/2+(22*1));
  text("#isabellastewartgardner", width/2, height/2+(25*2));
  text("#gardnermuseum", width/2, height/2+(25*3));
  text("@gardnermuseum", width/2, height/2+(25*4));

// -------------  CREATE ARRAY OF COORDINATES FOR PLACEMENT  -------------
//--------------------------------------------------------------------------------------------------------
  placement_x = new int[width/insta_size];
  placement_y = new int[height/insta_size];
  
  for (int i = 1; i < (placement_x.length+1); i++) {
    placement_x[i-1] = i;
  }
  for (int i = 1; i < (placement_y.length+1); i++) {
  placement_y[i-1] = i;
  }
    
// -------------  LOOP SETUP -------------
//--------------------------------------------------------------------------------------------------------
  currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
  offset = 0;
  x_counter = 0;
  y_counter = 0;
  image_loop = 0;
}


void draw() {
  
// -------------  ACCESS API -------------
//----------------api should only be access when certain conditions are met-------------------------------
    if ((image_loop == numFrames) || image_loop == 0) {
      accessAPI(api);
    }
  
// -------------  RENDER EACH IMAGE TO CANVAS -------------
//--------------------------------------------------------------------------------------------------------
  image(images[image_loop], insta_size*x_counter, insta_size*y_counter, insta_size, insta_size);
  
// -------------  INCREMENT COUNTERS FOR NEXT IMAGE -------------
//--------------------------------------------------------------------------------------------------------
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
    delay(100);
}

// -------------  DEFINE FUNCTIONS  -------------
//--------------------------------------------------------------------------------------------------------

void accessAPI(String api_address) {
  instagram = loadJSONObject(api_address);
  post = instagram.getJSONObject("news_feed").getJSONObject("posts").getJSONArray("post");
  //println(post);
/**
  for (int i=0; i<post.size(); i++){
    try {
      url1 = post.getJSONObject(i).getJSONObject("content").getString("content_picture");
      img_get.save("output/result"+i+".jpg");
    } catch(Exception e){
      url_proxy = "https://scontent.cdninstagram.com/t51.2885-15/s640x640/sh0.08/e35/21297053_294573284282726_1278537083127857152_n.jpg";
      img_proxy = loadImage(url_proxy);
      img_proxy.save("output/result"+i+".jpg");
    }
  }
**/ 
  for (int i=0; i < post.size(); i++) {
    String imageName = "output/result"+i+".jpg";
    images[i] = loadImage(imageName);
  }
}

// -------------  REFERENCE  -------------
//--------------------------------------------------------------------------------------------------------
/**
--------------------------- 
  for (int x = 0; x < numFrames; x += 1) { 
    image(images[(currentFrame+offset) % numFrames], insta_size*x_counter, insta_size*y_counter, insta_size, insta_size);
    offset+=1;
---------------------------    
      for (int i=0; i<post.size(); i++) {
    try {
      url1 = post.getJSONObject(i).getJSONObject("content").getString("content_picture");
      img_get = loadImage(url1);
      img_get.save("output/result"+i+".jpg");
    } catch(Exception e) {
      url_proxy = "https://scontent.cdninstagram.com/t51.2885-15/s640x640/sh0.08/e35/21297053_294573284282726_1278537083127857152_n.jpg";
      img_proxy = loadImage(url_proxy);
      img_proxy.save("output/result"+i+".jpg");
    }

// -------------  ACCESS API AND SAVE IMAGES TO LOCAL  -------------
//--------------------------------------------------------------------------------------------------------

// -------------  access dialogfeed api
//--------------------------------------------------------------------------------------------------------
//access to the api has been moved to function "accessAPI" for test within void draw()
/**  instagram = loadJSONObject(
  "https://app.dialogfeed.com/en/snippet/isg-display.json?api_key=e2e57b8f7cec6a72dcff7db8ad977dea");
  post = instagram.getJSONObject("news_feed").getJSONObject("posts").getJSONArray("post");
**/  
    
// -------------  save images to file for quicker access
//--------------------------------------------------------------------------------------------------------
//access to the api has been moved to function "accessAPI" for test within void draw()
  /** --- commented out while building ---
  for (int i=0; i<post.size(); i++) {
    try {
      url1 = post.getJSONObject(i).getJSONObject("content").getString("content_picture");
      img_get = loadImage(url1);
      img_get.save("output/result"+i+".jpg");
    } catch(Exception e) {
      url_proxy = "https://scontent.cdninstagram.com/t51.2885-15/s640x640/sh0.08/e35/21297053_294573284282726_1278537083127857152_n.jpg";
      img_proxy = loadImage(url_proxy);
      img_proxy.save("output/result"+i+".jpg");
    }    
  } --- commented out while building --- **/

// -------------  load images ---------
//--------------------------------------------------------------------------------------------------------
//access to the api has been moved to function "accessAPI" for test within void draw()
/**
  for (int i=0; i < post.size(); i++) {
    String imageName = "output/result"+i+".jpg";
    images[i] = loadImage(imageName);
  }
**/