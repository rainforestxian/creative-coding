import processing.pdf.*;
String imagename = "wallpaper.jpg";
PImage img;
int linenum = 1000;
int group = 0;
float step = 3;
float[]x = new float[10000];
float[]y = new float[10000];
float[]theta = new float[10000];

void settings() {
  img = loadImage(imagename);
  size(img.width, img.height);
}

void setup() {
  noStroke();
  background(255);
  loadPixels();
}

void draw() {
  for (int i=0; i<=theta.length-1; i++) {
    if (x[i]>width | x[i]<0) {
      theta[i] = PI-theta[i];
    }
    if (y[i]>height | y[i]<0) {
      theta[i] = -theta[i];
    }
    x[i] += step*cos(theta[i]);
    y[i] += step*sin(theta[i]);

    color c = img.get(int(x[i]), int(y[i]));
    fill(c);
    noStroke();
    rect(x[i], y[i], 1, 1);
  }
   // saveFrame("picture-######.jpg");
}

void mousePressed() {
  for (int i=group*linenum; i<=(group+1)*linenum-1; i++) {
    x[i]=mouseX;
    y[i]=mouseY;
    theta[i]=random(0, 2*PI);
  }
  group++;
}
