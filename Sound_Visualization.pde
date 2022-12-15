import ddf.minim.*;

Minim minim;
AudioInput in;

int num = 100;
float rround = 150;
float line_weight = 2;
float completity = 1;
float xx = 500;
float yy = 300;
int backgroundgrey = 0;
int Divergence = 1000;

void setup() {
  size(800, 600, P2D);
  minim = new Minim(this);
  in = minim.getLineIn();
  UI();
}

void draw() {
  background(backgroundgrey);
  stroke(255);

  strokeWeight(line_weight);
  float a = 0;
  float angle = (2*PI) / num;

  int step = in.bufferSize() / num;
  for(int i=0; i < completity*(in.bufferSize() - step); i+=step) {
    float x = xx + cos(a) * (Divergence * in.mix.get(i) + rround);
    float y = yy + sin(a) * (Divergence * in.mix.get(i) + rround);
    float x2 = xx + cos(a + angle) * (Divergence * in.mix.get(i+step) + rround);
    float y2 = yy + sin(a + angle) * (Divergence * in.mix.get(i+step) + rround);
    line(x,y,x2,y2);
    a += angle;
  }
  UIShow();
}

import controlP5.*;
import peasy.*;

PeasyCam cam;
ControlP5 bar;

int canvasLeftCornerX = 30;
int canvasLeftCornerY = 60;

void UI() {
  bar = new ControlP5(this, createFont("微软雅黑", 14));

  int barSize = 200;
  int barHeight = 30;
  int barInterval = barHeight + 20;

  bar.addSlider("num", 3, 200, 100, canvasLeftCornerX, canvasLeftCornerY, barSize, barHeight).setLabel("细分边数");
  bar.addSlider("line_weight", 1, 4, 2, canvasLeftCornerX, canvasLeftCornerY+barInterval, barSize, barHeight).setLabel("圆边粗细");
  bar.addSlider("completity", 0, 1, 1, canvasLeftCornerX, canvasLeftCornerY+barInterval*2, barSize, barHeight).setLabel("圆边完整度");
  bar.addSlider("rround", 10, 300, 150, canvasLeftCornerX, canvasLeftCornerY+barInterval*3, barSize, barHeight).setLabel("圆半径值");
  bar.addSlider("xx", 0, 800, 500, canvasLeftCornerX, canvasLeftCornerY+barInterval*5, barSize, barHeight).setLabel("圆心X值");
  bar.addSlider("yy", 0, 600, 300, canvasLeftCornerX, canvasLeftCornerY+barInterval*6, barSize, barHeight).setLabel("圆心Y值");
  bar.addSlider("backgroundgrey", 0, 255, 0, canvasLeftCornerX, canvasLeftCornerY+barInterval*8, barSize, barHeight).setLabel("背景灰度值");
  bar.addSlider("Divergence", 100, 5000, 1000, canvasLeftCornerX, canvasLeftCornerY+barInterval*9, barSize, barHeight).setLabel("发散度");

  bar.setAutoDraw(false);
}

void UIShow() {
  bar.draw();
}
