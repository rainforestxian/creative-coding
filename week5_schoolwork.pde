import controlP5.*;
import peasy.*;

int sectionSideNum = 5;
int sideDivision = 40;
int cylinderHeightSection = 200;
int backgroundgrey = 50;
float cylinderSectionHeight = 10;
int rd = 40;
int rr,gg,bb,rrr,ggg,bbb = 100;
float sectionRadiusPhase = TWO_PI;
float linearity = 0;
float[] sectionR = new float[cylinderHeightSection+1];

PeasyCam cam;
ControlP5 bar;

boolean displayMesh = false;

void setup() {
  size(800, 800, P3D);
  cam = new PeasyCam(this, 2000);
  initiateValues();
  UI();
}

void initiateValues() {
  for (int  i =0; i < cylinderHeightSection+1; i ++) {
    sectionR[i] = (rd + i*linearity) * (2 + sin((sectionRadiusPhase/cylinderHeightSection) * i));
  }
}

void draw() {
  background(backgroundgrey);
  noStroke();

  if (displayMesh) {
    stroke(0);
  }

  fill(202);
  noStroke();

  lightSettings(); 

  initiateValues();
  drawCylinder();

  UIShow();
}

void drawCylinder() {
  float theta = TWO_PI / sectionSideNum;
  beginShape(TRIANGLES);

  for (int j = 0; j < cylinderHeightSection; j ++) {
    fill(rr+(rrr-rr)*j/cylinderHeightSection,gg+(ggg-gg)*j/cylinderHeightSection,bb+(bbb-bb)*j/cylinderHeightSection);
    for (int i = 0; i < sectionSideNum; i ++) {
      float x11 = sectionR[j] * cos(theta * i);
      float y11 = sectionR[j] * sin(theta * i);
      float x12 = sectionR[j] * cos(theta * ((i+1)%sectionSideNum));
      float y12 = sectionR[j] * sin(theta * ((i+1)%sectionSideNum));

      float x21 = sectionR[j+1] * cos(theta * i);
      float y21 = sectionR[j+1] * sin(theta * i);
      float x22 = sectionR[j+1] * cos(theta * ((i+1)%sectionSideNum));
      float y22 = sectionR[j+1] * sin(theta * ((i+1)%sectionSideNum));


      float deltaX12 = (x12 - x11) / sideDivision;
      float deltay12 = (y12 - y11) / sideDivision;
      float deltaX22 = (x22 - x21) / sideDivision;
      float deltay22 = (y22 - y21) / sideDivision;

      for (int k = 0; k < sideDivision; k ++) {
        vertex(x11 + deltaX12 * k, y11 + deltay12 * k, cylinderSectionHeight * j);
        vertex(x21 + deltaX22 * (k+1), y21 + deltay22 * (k+1), cylinderSectionHeight * (j+1));
        vertex(x11 + deltaX12 * (k+1), y11 + deltay12 * (k+1), cylinderSectionHeight * j);

        vertex(x11 + deltaX12 * k, y11 + deltay12 * k, cylinderSectionHeight * j);
        vertex(x21 + deltaX22 * k, y21 + deltay22 * k, cylinderSectionHeight * (j+1));
        vertex(x21 + deltaX22 * (k+1), y21 + deltay22 * (k+1), cylinderSectionHeight * (j+1));
      }
    }
  }
  endShape();
  println(sectionR[0],sectionR[1]);
}

int canvasLeftCornerX = 30;
int canvasLeftCornerY = 60;

void UI() {
  bar = new ControlP5(this, createFont("微软雅黑", 14));

  int barSize = 200;
  int barHeight = 30;
  int barInterval = barHeight + 20;

  bar.addSlider("sectionSideNum", 3, 16, 5, canvasLeftCornerX, canvasLeftCornerY, barSize, barHeight).setLabel("断面边数");
  bar.addSlider("sideDivision", 1, 100, 40, canvasLeftCornerX, canvasLeftCornerY+barInterval, barSize, barHeight).setLabel("断面边细分段数");
  bar.addSlider("cylinderSectionHeight", 0, 100, 10, canvasLeftCornerX, canvasLeftCornerY+barInterval*3, barSize, barHeight).setLabel("柱体分段高度");
  bar.addSlider("sectionRadiusPhase", 0, PI*8, TWO_PI, canvasLeftCornerX, canvasLeftCornerY+barInterval*4, barSize, barHeight).setLabel("柱体半径相变");
  bar.addSlider("rd", 0, 255, 40, canvasLeftCornerX, canvasLeftCornerY+barInterval*5, barSize, barHeight).setLabel("柱体底部宽度");
  bar.addSlider("linearity", 0, 5, 0, canvasLeftCornerX, canvasLeftCornerY+barInterval*6, barSize, barHeight).setLabel("柱体轮廓倾斜度");
  bar.addSlider("backgroundgrey", 0, 255, 100, canvasLeftCornerX, canvasLeftCornerY+barInterval*7, barSize, barHeight).setLabel("背景灰度值");
  bar.addSlider("rr", 0, 255, 100, canvasLeftCornerX, canvasLeftCornerY+barInterval*9, barSize, barHeight).setLabel("底部RGB的R初始值");
  bar.addSlider("gg", 0, 255, 100, canvasLeftCornerX, canvasLeftCornerY+barInterval*10, barSize, barHeight).setLabel("底部RGB的G初始值");
  bar.addSlider("bb", 0, 255, 100, canvasLeftCornerX, canvasLeftCornerY+barInterval*11, barSize, barHeight).setLabel("底部RGB的B初始值");
  bar.addSlider("rrr", 0, 255, 100, canvasLeftCornerX, canvasLeftCornerY+barInterval*12, barSize, barHeight).setLabel("顶部RGB的R初始值");
  bar.addSlider("ggg", 0, 255, 100, canvasLeftCornerX, canvasLeftCornerY+barInterval*13, barSize, barHeight).setLabel("顶部RGB的G初始值");
  bar.addSlider("bbb", 0, 255, 100, canvasLeftCornerX, canvasLeftCornerY+barInterval*14, barSize, barHeight).setLabel("顶部RGB的B初始值");

  bar.setAutoDraw(false);
}

void lightSettings() {
  lightSpecular(255, 255, 255);
  directionalLight(255, 255, 255, 1, 1, -1);
  directionalLight(127, 127, 127, -1, -1, 1);
  specular(200, 200, 200);
  shininess(15);
}

void UIShow() {
  cam.beginHUD();  
  lights();
  bar.draw();
  cam.endHUD();

  if (mouseX<400 && mouseY< height) {
    cam.setActive(false);
  } else {
    cam.setActive(true);
  }
}
