int lifetime;
Population population; 
Obstacle target; 

int lifecycle; 
int recordtime;

ArrayList<Obstacle> obstacles;

void setup() {
  size(800, 800);
  lifetime = 500;

  lifecycle = 0;
  recordtime = lifetime;

  target = new Obstacle(width/2, 24, 24, 24);
  float mutationRate = .1;
  population = new Population(mutationRate, 70);
  obstacles = new ArrayList<Obstacle>();
  obstacles.add(new Obstacle(0, height/4, width/4, 3*height/4));
  obstacles.add(new Obstacle(width/4, height/2, 3*width/16, height/4));
  obstacles.add(new Obstacle(width/2-50, height/4, width/8+50, height/8));
  obstacles.add(new Obstacle(width/2, 7*height/8, width/2, height/4));
  obstacles.add(new Obstacle(width/2+100, height/4, width/2, 3*height/4));
}

void draw() {
  background(255);
  target.display();

  if (lifecycle < lifetime) {
    population.live(obstacles);
    if ((population.targetReached()) && (lifecycle < recordtime)) {
      recordtime = lifecycle;
    }
    lifecycle++;
  } else {
    lifecycle = 0;
    population.fitness();
    population.selection();
    population.reproduction();
  }

  for (Obstacle obs : obstacles) {
    obs.display();
  }

  fill(0);
  text("Generation #: " + population.getGenerations(), 10, 18);
  text("Cycles left: " + (lifetime-lifecycle), 10, 36);
  text("Record cycles: " + recordtime, 10, 54);
}
