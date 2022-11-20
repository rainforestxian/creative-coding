int flowernum, num=1;
float runningspeed = 0.5;
flower[] Flower= new flower[100000];


void setup() {
  size(1280, 900);
  background(255);
  fill(0);
  Flower[0] = new flower(width/2, height/2);
}

void draw() {
  background(255);
  flowernum = 0;
  for (int i=0; i<num; i++) {
    Flower[i].update();
  }
//  saveFrame("picture-######.jpg");
}

class flower { //<>//

  float x, y;
  float life;
  boolean alive = true;
  float age =0;
  float breedage = random(30,45);
  int around = 0;

  flower(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void update() {
    this.around = 0;
    this.age += runningspeed;
    this.life=100;
  
    if (this.alive==true) {

      for (int c = 0; c<num; c++) {
        if ((Flower[c].alive==true) && ((Flower[c].x-this.x)*(Flower[c].x-this.x)+(Flower[c].y-this.y)*(Flower[c].y-this.y)< 900)) {
          this.around++;
        }
      }


      if (this.around > 10)
      { 
        this.life = 150/(around-9);
      }

      if (this.age > this.life) {
        this.alive = false;
      }

      drawflower();

      if (this.age >= breedage && this.age < breedage+runningspeed) {
        breed();
      }
    }
  }


  void breed() {
    for (int i=0; i<2; i++) {
      float distance, angle;
      distance =random(-80, -60);
      angle = random(0, 2*PI);
      Flower[num] = new flower(this.x+distance*cos(angle), this.y+distance*sin(angle));
      num++;
    }
  }

  void drawflower() {
    fill(0, 255, 0);
    rect(this.x, this.y, 5*this.age/100, 60*this.age/100);

    fill(0, 0, 255);
    ellipse(this.x+(2.5+12)*this.age/100, this.y, 18*this.age/100, 18*this.age/100);
    ellipse(this.x+(2.5-12)*this.age/100, this.y, 18*this.age/100, 18*this.age/100);
    ellipse(this.x+2.5*this.age/100, this.y+12*this.age/100, 18*this.age/100, 18*this.age/100);
    ellipse(this.x+2.5*this.age/100, this.y-12*this.age/100, 18*this.age/100, 18*this.age/100);

    fill(255, 0, 0);
    ellipse(this.x+2.5*this.age/100, this.y, 12*this.age/100, 12*this.age/100);
  }
}
