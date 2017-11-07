
// Display a randomly chosen tweet from the Donald Trump tweet list.

class TweetDisplay {
  
// fields
  String infile = "allTweets.txt";
  String infile2 = "randomTweet.txt";
  PImage img;
  ArrayList<String> tweetList;
  float TrumpBirdw, TrumpBirdh;

// constructors
  TweetDisplay() {
  }
  
  TweetDisplay(float TrumpBirdw, float TrumpBirdh) {

// pull from datafile
    String[] tokens2 = loadStrings(infile);    
    final ArrayList<String> tweetList = new ArrayList(tokens2.length);
    //Collections.addAll(tweetList, tokens2); 
    String[] randomTweet = loadStrings(infile2); 
    
// Draw a random Trump Tweet
    String tweet = randomTweet[0];
    
// Display the Trump Tweet    
    PFont f = createFont("Times New Roman", 20);
    textFont(f, 20);
    PGraphics pg = createGraphics(2000, 400);
    pg.beginDraw();
      pg.textFont(f, 20);
      fill(255);
      pg.text(tweet, 20, 20);
    pg.endDraw();
    img = pg;
    blend(img, 0, 0, int(TrumpBirdw * 3.1), int(TrumpBirdh), int(TrumpBirdw) - 170, int(TrumpBirdh) - 86, int(TrumpBirdw * 3.1), int(TrumpBirdh), LIGHTEST);
  }
}