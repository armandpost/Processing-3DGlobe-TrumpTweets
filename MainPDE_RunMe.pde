
// Author:     Armand Post
// Date:       August 6th, 2017
// Class:      MSDS 6390
// Section:    403
// Assignment: Final

// Description:

// The original idea was to pull tweets along with Latitude and Longitude and display on a 3D rendered globe.
// However, tweets could not be mined that had Latitude and Longitude attached.
// Data that consisted of major cities and their Latitude and Longitude were found at http://simplemaps.com/data/world-cities.
// A csv was downloaded from there and displayed on the globe.

// Another theme that was being explore was to somehow integrate tweets from Donald Trump.
// Some interaction was built in by obtaining a csv of tweets from http://www.trumptwitterarchive.com/archive.
// Press T to make the Donald Trump twitter bird tweet.  X, Y, or Z resumes the earth's rotation.

float lat, lon, r;
PVector coord;

PImage earth, TrumpBird; 
PShape globe;

float camRot;
float camRotSpeed;
private static final int ROT_X = 0;
private static final int ROT_Y = 1;
private static final int ROT_Z = 2;
int rotationAxis;

PImage img, img1, img2, img3;
Table table;

// classes
TrumpCSV csv;
TweetDisplay tweetdisplay;
Convert convert;


void setup() {
  size(1536, 960, P3D);
  coord = new PVector();
  
  r = 200;                   // sphere's radius  

  earth = loadImage( "earth5.jpg");
  noStroke();
  globe = createShape(SPHERE, r); 
  globe.setTexture(earth);
  
  camRotSpeed = 0.010;
  rotationAxis = ROT_Y;

// Pull and resize Trump bird image.
  TrumpBird = loadImage("trumpbird.png");
  float TrumpBirdw = TrumpBird.width;
  float TrumpBirdh = TrumpBird.height;
  TrumpBird.resize(int(TrumpBirdw * .2), int(TrumpBirdh * .2));
  
// Load Latitude and Longitude for Cities
  table = loadTable("cities.csv", "header");
}



    
void draw() {
  background(25);

// append additional images / text to the background
  final float TrumpBirdw = TrumpBird.width;
  float TrumpBirdh = TrumpBird.height;
  blend(TrumpBird, 0, 0, int(TrumpBirdw), int(TrumpBirdh), int(TrumpBirdw) - 450, int(TrumpBirdh) - 150, int(TrumpBirdw), int(TrumpBirdh), LIGHTEST);
  Instructions();
  blend(img1, 0, 0, int(TrumpBirdw * 2.1), int(TrumpBirdh), int(TrumpBirdw) - 400, int(TrumpBirdh) + 650, int(TrumpBirdw * 2.1), int(TrumpBirdh), LIGHTEST);
  Instructions2();
  blend(img2, 0, 0, int(TrumpBirdw * 2), int(TrumpBirdh), int(TrumpBirdw) - 400, int(TrumpBirdh) + 675, int(TrumpBirdw * 2), int(TrumpBirdh), LIGHTEST);
  Instructions3();
  blend(img3, 0, 0, int(TrumpBirdw * 2), int(TrumpBirdh), int(TrumpBirdw) - 400, int(TrumpBirdh) + 700, int(TrumpBirdw * 2), int(TrumpBirdh), LIGHTEST);
  
  if(keyPressed) {
    if(key == 'p' || key == 'P') {
      boolean paused;
    }
  } else if (key == 't' || key == 'T') {
      //tweetdisplay = new TweetDisplay(TrumpBirdw, TrumpBirdh);
      if (mousePressed == true) {
        csv = new TrumpCSV();
      }
      else frameRate(60);
        tweetdisplay = new TweetDisplay(TrumpBirdw, TrumpBirdh);
  } else {
    camRot += camRotSpeed;
    beginCamera();
      camera(0, -250, 500, 0, 0, 0, 0, 1, 0);
      switch(rotationAxis)
      {
        case ROT_X :
          rotateX(camRot);
        break;
        case ROT_Y :
          rotateY(camRot);
        break;
        case ROT_Z :
          rotateZ(camRot);
        break;
      }
    endCamera();    
    lights();
  }
  
// earth
  noFill();
  stroke(0,127,255);
  strokeWeight(1);
    
  noStroke();
  shape(globe);
  
// points
  fill(255,0,0);
  stroke(255,0,0);
  strokeWeight(3);

// test Dallas here
  lat = 32.7808182;                   // Dallas Latitude
  lon = -96.7984027;                  // Dallas Longitude
  convert = new Convert(lat, lon);
  point(coord.x, coord.y, coord.z);

// pull the csv with cities and latitude and longitude and plot them on the globe.
  for (TableRow row : table.rows()) {
    float lat = row.getFloat("lat");
    float lon = row.getFloat("lng");
    String city = row.getString("city");
    convert = new Convert(lat, lon);
    pushMatrix();
      point(coord.x, coord.y, coord.z);
      if(mouseX == coord.x && mouseY == coord.y) {
        println(city);
      }
    popMatrix();
  }
  
}


void keyPressed()
{
  if(key == 'x')
  {
    rotationAxis = ROT_X;
  }
  else if(key == 'y')
  {
    rotationAxis = ROT_Y;
  }
  else if(key == 'z')
  {
    rotationAxis = ROT_Z;
  }
  else if(key == ' ')
  {
    camRotSpeed = camRotSpeed != 0 ? 0 : 0.005; 
  }
}
