class Node implements Comparable<Node> {
  
  String protein;
  PVector pos; //position
  PVector repForce; // sum of repelling force from all other nodes
  float Kr; // constant for the repForce
  PVector springForce; // spring force to act on it
  
  Node[] neighbors; //nodes it is connected to
  boolean highlighted; //if selected
  
  
  Node(String name, int x, int y, float Kr) {
    //println(x);
    pos = new PVector (x, y);
    println(pos);
    pos.x = 0;
    pos.y = 0;
    protein = name;
    this.Kr = Kr;
    repForce = new PVector(0,0);
    //println(pos.x);
  }
  
  
  void display() {
    fill(128,0,128);//color purple
    //println(pos);
    ellipse(pos.x, pos.y, 10, 10); //10 is the size
    //println(pos.x);
  }
  
  void update() {
    pos = pos.add(repForce);
    pos = pos.add(springForce);
    if(pos.x < 0) {
      pos.x = 0;
    }
    if(pos.x > width) {
      pos.x = width;
    }
    if(pos.y < 0) {
      pos.y = 0;
    }
    if(pos.y > height) {
      pos.y = height;
    }
         
  }
 
  
  
  //PVector repel(Node other) {//calculates repel force
    //PVector ans = new PVector(0,0);
    //ans.x = Kr / ( ( pos.x - other.pos.x ) * ( pos.x - other.pos.x ) );
    //ans.y = Kr / ( ( pos.y - other.pos.y ) * ( pos.y - other.pos.y ) );
    //println("ansy" + ans.y);
    //println(ans);
    //return ans;
    //Fr = Kr/d^2
  //}
  
  PVector repel (Node other) {//calculates repel force
    PVector ans = new PVector(10,10);
    float dx = other.pos.x - pos.x;
    float dy = other.pos.y - pos.y;
    if (dx != 0 || dy != 0) {
      float distance = getDist(other);
      ans.x = Kr / (distance * distance) * dx/distance;
      ans.y = Kr / (distance * distance) * dy/distance;
    }
    return ans;
  }
  
  
  public String toString(){
    return protein;
  }
  
  
  public int compareTo(Node other){
    return protein.compareTo(other.protein);
  }
  
  
  float getDist(Node other) {
    return pos.dist( other.pos );
  }
 
  int getDegree() {
    //return numConnections
    return 0;
  }
  
  void highlight() {
    //change color + other stuff
  }
  
  
  
}