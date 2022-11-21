class river {
  float x, y;
  float river_width;
  float river_age;

  river() {
    x = 0;
    y = 0;
    river_width = 0;
    river_age = 0;
  }

  river(int x_, int y_, int w_, int a_) {
    x = x_;
    y = y_;
    river_width = map(w_, 0, width, 0, 32);
    river_age = a_;
  }

  void display() {
    stroke(32);
    flow(x, y, 0, 1, true, river_width);
  }

  void flow(float x_, float y_, float a_, float generation, boolean main, float f_w) {
    float a = random(-PI/16, PI/16)+a_;
    float g_ = generation;
    float single_length = 830/(generation+1);
    float nx = cos(a)*single_length+x_;
    float ny = sin(a)*single_length+y_;
    boolean m_ = main;
    float single_width;
    if (m_) {
      single_width = f_w;
    } else {
      single_width = this.river_width / generation;
    }
    strokeWeight(single_width);
    stroke(0,map(single_width,0,32,255,25),255);
    int ax = (int)(x_+ nx)/2;
    smooth();
    noFill();
    bezier(x_, y_, ax, y_, ax, ny, nx, ny);
    if (g_ < 5) {
      flow(nx, ny, a_-random(PI/4, PI/3), (g_+1), false, single_width);
      flow(nx, ny, a_+random(PI/4, PI/3), (g_+1), false, single_width);
      flow(nx, ny, a_, (g_+1), true, single_width);
    } else {
    }
  }
}
river River = new river();

void setup() {
  size(1200, 1200);
  colorMode(RGB, 255);
  background(255);
  smooth();
}

void draw() {
  //saveFrame("picture-######.jpg");
}

void keyReleased() {
  background(255);
}

void mouseReleased() {
  River = new river(mouseX, mouseY, width-mouseX, 0);
  River.display();
}
