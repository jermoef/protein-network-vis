Network network;

void setup() {
  size(1200, 700);
  background(0);
  network = new Network("cluster.csv");
  
  
  
  // load the file
  // initialize nodes
  // initialize edges
  
}


void draw() {
  
  network.update();
  
}



void zoom(int x, int y) {
  //zooms on point (x,y)
  
}