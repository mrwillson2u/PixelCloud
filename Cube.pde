class Cube {
  PVector location;
  int size = 10;
  color cubeColor;
  Cube(float x, float y, float z) {
    location = new PVector(x, y, z);
    setColor(0);
  }
  
  void draw(float angle) {
    rectMode(CENTER);
    noStroke();
    setColor(angle);
    fill(cubeColor);
    pushMatrix();
    //rotateY(radians(-angle));
    
    translate(location.x, location.y, location.z);
    rotateY(radians(-angle));
    rect(0, 0, size, size);
    popMatrix();
  }
  
  void setColor(float angle) {
    float newX = camPos.z * cos(radians(angle));
    float newY = camPos.z * sin(radians(angle));
    PVector newCam = new PVector(newX, camPos.y, newY);
    
    float distance = location.dist(newCam);
    cubeColor = color(map(distance, 0, 1415, 0, 239), 100, 100);
    //println(distance, map(distance, 0, 1415, 0, 239));
  }
  
  float distFromCam(float angle) {
    float newX = camPos.z * cos(radians(-angle));
    float newY = camPos.z * sin(radians(-angle));
    PVector newCam = new PVector(newX, camPos.y, newY);
    float distance = location.dist(newCam);
    println("map: ", map(distance, 0, 1415, 0, 239));
    return location.dist(newCam);
  }
  
}
