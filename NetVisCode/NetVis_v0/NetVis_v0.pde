Network network;

void setup() {
  size(1200, 700);
  network = new Network(10);
  background(100);
}

void draw() {
  
  network.update();
  
}

void keyPressed() {
  if (key == 'q') {
    exit();
  }
}