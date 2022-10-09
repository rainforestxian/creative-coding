float tmp_x, tmp_y, tmp_size, a, b = 0;
int i = 2, j = 1;
void setup() {
  size(600, 770);  
  background(255);
}
void draw() {
  if (i<=5) {
    if (j<=i) {
      a = int(random(0, 4));
      while (b == 0 | b ==a) {
        b = int(random(0, 4));
      }
      pic_line(width/i*(j-1), tmp_y, 600/i, 5, a);  
      pic_line(width/i*(j-1), tmp_y, 600/i, 5, b);  
      j++;
    }
    if (j > i) {
      j=1;
      tmp_y += 600/i;
      i++;
    }
  }
  if (i == 6) {
    noLoop();
  }
  saveFrame("line-######.jpg");
}


void pic_line(float x, float y, float size, float gap, float a) {
  stroke(0);
  line(x, y, x+size, y);
  line(x+size, y, x+size, y+size);
  line(x+size, y+size, x, y+size);
  line(x, y+size, x, y);

  stroke(160);
  if (a == 1) {
    for (int step = 0; step <= size; step += gap) {
      line(x, y+step, x+size, y+step);
    }
  } else if (a == 2) {
    for (int step = 0; step <= size; step += gap) {
      line(x+step, y, x+step, y+size);
    }
  } else if (a == 3) {
    line(x, y+size, x+size, y);
    for (int step = int(gap); step <= size; step += gap) {
      line(x, y+size-step, x+size-step, y);
      line(x+step, y+size, x+size, y+step);
    }
  } else {
    line(x, y, x+size, y+size);
    for (int step = int(gap); step <= size; step += gap) {
      line(x+step, y, x+size, y+size-step);
      line(x, y+step, x+size-step, y+size);
    }
  }
}
