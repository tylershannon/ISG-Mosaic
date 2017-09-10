int random_index, random_x, random_y, insta_size, insta_countx;
int currentFrame = 0;
int numFrames = 106;
PImage img_get, img_proxy, img_render;
PImage[] images = new PImage[numFrames];
String url1, url_proxy;
JSONObject instagram;
JSONArray post;
PFont fontBold;
PFont fontLight;
int[] fileNumber;
int[] placement_x;
int[] placement_y;

void settings() {
  size((displayHeight*9)/16, displayHeight);
}

void setup () {
  insta_countx = 4;
  insta_size = width/insta_countx;
  // --- setup background environment
  background(#e5439a);
  fill(255);
  fontBold = createFont("Futura-Bold", 40);
  fontLight = createFont("Futura-Medium", 25);
  textFont(fontBold);
  textAlign(CENTER, CENTER);
  text("Henry James And", width/2, height/2-(45*3));
  text("American Painting", width/2, height/2-(40*2));
  textFont(fontLight);
  text("#isgmosaic", width/2, height/2+(22*1));
  text("#isabellastewartgardner", width/2, height/2+(25*2));
  text("#gardnermuseum", width/2, height/2+(25*3));
  text("@gardnermuseum", width/2, height/2+(25*4));

  // -------------  CREATE ARRAY OF COORDINATES FOR PLACEMENT  -------------
  placement_x = new int[width/insta_size];
  placement_y = new int[height/insta_size];

  //println(placement_y);
  for (int i = 1; i < (placement_x.length+1); i++) {
    placement_x[i-1] = i;
  }
  for (int i = 1; i < (placement_y.length+1); i++) {
  placement_y[i-1] = i;
  }
  // -------------  ACCESS API AND SAVE IMAGES TO LOCAL  -------------
  // --- access dialogfeed api
  instagram = loadJSONObject("https://app.dialogfeed.com/en/snippet/isg-display.json?api_key=e2e57b8f7cec6a72dcff7db8ad977dea");
  post = instagram.getJSONObject("news_feed").getJSONObject("posts").getJSONArray("post");
  
    /** 1.--- commented out while building ---
  // --- save images to file for quicker access
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
  } 1.--- commented out while building --- **/
  
  for (int i=0; i < post.size(); i++) {
    String imageName = "output/result"+i+".jpg";
    images[i] = loadImage(imageName);
  }
}


void draw() {
  // render each image to canvas
  currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
  int offset = 0;
  for (int x = -100; x < width; x += images[0].width) { 
    int placement_value = int(random(0,insta_countx));
    image(images[(currentFrame+offset) % numFrames], 0, 0, width/insta_countx, width/insta_countx);
    offset+=1;
    delay(500);
  }
}