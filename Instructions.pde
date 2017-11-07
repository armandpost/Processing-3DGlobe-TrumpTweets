
// Display the instructions at the bottom left of the screen

void Instructions()
{
    String line1 = "Press X, Y, or Z to change rotation angle.  Any of these key presses will make the earth rotate again.";
    PFont f = createFont("Times New Roman", 20);
    textFont(f, 20);
    PGraphics pg = createGraphics(2000, 400);
    pg.beginDraw();
      pg.textFont(f, 20);
      fill(255);
      pg.text(line1, 20, 20);
    pg.endDraw();
    img1 = pg;
}


void Instructions2()
{
    String line2 = "Press T to make the Trump bird tweet.  Click the mouse for a new Tweet.";
    PFont f = createFont("Times New Roman", 20);
    textFont(f, 20);
    PGraphics pg = createGraphics(2000, 400);
    pg.beginDraw();
      pg.textFont(f, 20);
      fill(255);
      pg.text(line2, 20, 20);
    pg.endDraw();
    img2 = pg;
}


void Instructions3()
{
    String line3 = "Press P to pause and turn off the lights.";
    PFont f = createFont("Times New Roman", 20);
    textFont(f, 20);
    PGraphics pg = createGraphics(2000, 400);
    pg.beginDraw();
      pg.textFont(f, 20);
      fill(255);
      pg.text(line3, 20, 20);
    pg.endDraw();
    img3 = pg;
}