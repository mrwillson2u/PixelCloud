class Cube {
  PVector location;
  PVector screenUpperLeft = new PVector();
  PVector screenLowerRight = new PVector();
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
    screenLowerRight = new PVector(screenX(0-(size/2), 0-(size/2), 0), screenY(0-(size/2), 0-(size/2), 0));
    screenUpperLeft = new PVector(screenX(0+(size/2), 0+(size/2), 0), screenY(0+(size/2), 0+(size/2), 0));
    rect(0, 0, size, size);
    popMatrix();
  }
  
  void setColor(float angle) {
    if(!checkMouse(mouseX, mouseY)) {
      float newX = camPos.z * cos(radians(angle));
      float newY = camPos.z * sin(radians(angle));
      PVector newCam = new PVector(newX, camPos.y, newY);
      
      float distance = location.dist(newCam);
      cubeColor = color(map(distance, 0, 1415, 0, 239), 100, 100);
    }
    else {
      cubeColor = color(255, 0, 255);
    }
    //println(distance, map(distance, 0, 1415, 0, 239));
  }
  
  float distFromCam(float angle) {
    float newX = camPos.z * cos(radians(-angle));
    float newY = camPos.z * sin(radians(-angle));
    PVector newCam = new PVector(newX, camPos.y, newY);
    float distance = location.dist(newCam);
    //println("map: ", map(distance, 0, 1415, 0, 239));
    return location.dist(newCam);
  }
  
  boolean checkMouse(int xPos, int yPos) {
    if(xPos >= screenUpperLeft.x && xPos <= screenLowerRight.x && yPos <= screenUpperLeft.y && yPos >= screenLowerRight.y) {
      return true;
    }
    else {
      return false;
    }
  }
  
  void getScreenCoordinates() {
    println("Screen X: ", screenUpperLeft, "  Screen Y: ", screenLowerRight);
  }
  
}
