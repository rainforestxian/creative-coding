float x1, x2, x3, x4, y1, y2, y3, y4, y5;
int num = 0;
void setup() {
  size(600, 600);
  background(255);
  x1 = random(50, 100);
  x2 = random(450, 550);
  y1 = random(50, 100);
  y2 = random(150, 250);
  y3 = random(400, 450);
  y4 = random(550, 570);
  y5 = random(320, 360);
  x3 = random(280, 320);
  x4 = random(400, 420);
}

void draw() {
  switch(num) {
  case 0:
    strokeWeight(14);
    stroke(0);
    line(0, x1, y4, x1);
    num++;
    break;
  case 1:
    line(0, x2, 600, x2);
    num++;
    break;
  case 2:
    line(y1, x1, y1, 600);
    num++;
    break;
  case 3:
    line(y2, 0, y2, x1);
    num++;
    break;
  case 4:
    line(y3, 0, y3, 600);
    num++;
    break;
  case 5:
    line(y4, 0, y4, 600);
    num++;
    break;
  case 6:
    line(y3, x3, y4, x3);
    num++;
    break;
  case 7:
    line(y1, x4, y4, x4);
    num++;
    break;
  case 8:
    line(y5, x4, y5, 600);
    num++;
    break;

  case 9:
    strokeWeight(0);
    num++;
    break;
  case 10:
    fill(190, 190, 190);
    num++;
    break;
  case 11:
    rect(0, 0, y2-7, x1-7);
    num++;
    break;
  case 12:
    rect(y2+7, 0, y3-y2-14, x1-7);
    num++;
    break;
  case 13:
    rect(y4+7, 0, 600-y4-7, x2-7);
    num++;
    break;

  case 14:
    fill(211, 211, 211);
    num++;
    break;
  case 15:
    rect(0, x1+7, y1-7, x2-x1-14);
    num++;
    break;
  case 16:
    rect(y1+7, x2+7, y5-y1-14, 600-7-x2);
    num++;
    break;
  case 17:
    rect(y5+7, x4+7, y3-y5-14, x2-x4-14);
    num++;
    break;
  case 18:
    rect(y3+7, x3+7, y4-y3-14, x4-x3-14);
    num++;
    break;
  case 19:
    rect(y3+7, x4+7, y4-y3-14, x2-x4-14);
    num++;
    break;

  case 20:
    fill(205, 149, 12);
    num++;
    break;
  case 21:
    rect(0, x2+7, y1-7, 600-7-x2);
    num++;
    break;
  case 22:
    rect(y3+7, 0, y4-y3-14, x1-7);
    num++;
    break;
  case 23:
    rect(y3+7, x1+7, y4-y3-14, x3-x1-14);
    num++;
    break;

  case 24:
    fill(105, 89, 205);
    num++;
    break;
  case 25:
    rect(y3+7, x2+7, y4-y3-14, 600-x2-7);
    num++;
    break;

  case 26:
    fill(205, 0, 0);
    num++;
    break;
  case 27:
    rect(y4+7, x2+7, 600-7-y4, 600-x2-7);
    num++;
    break;
  case 28:
    rect(y1+7, x1+7, y3-y1-14, x4-x1-14);
    num++;
    break;

  case 29:
    fill(0);
    num++;
    break;
  case 30:
    rect(y1, x4, y5-y1, x2-x4);
    num++;
    break;
  case 31:
    rect(y5, x2, y3-y5, 600-x2);
    num++;
    break;
  }
  saveFrame("line-######.jpg");
}
