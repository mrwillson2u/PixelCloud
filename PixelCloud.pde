ArrayList<Cube> cubes = new ArrayList<Cube>();
Cube test;
int particleCount = 1000;
float cloudSize = 1000;
PVector camPos;
float currentAngle = 0.0;
void setup() {

  colorMode(HSB);
  size(960, 540, P3D);
  camPos = new PVector(width/2, height/2, -500);
  camera(camPos.x, camPos.y, camPos.z, width/2, height/2, 0, 0, 1, 0);
  for(int i = 0; i < particleCount; i++) {
    cubes.add(new Cube(random(-cloudSize/2, cloudSize/2), random(-cloudSize/2, cloudSize/2), random(-cloudSize/2, cloudSize/2)));
  }
  test = new Cube(0, 0, 0);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  rotateY(radians(currentAngle));
  for(int i = 0; i < particleCount; i++) {
    
    Cube thisCube = cubes.get(i);
    if(i == 0) {
      println("Dist from cube:", thisCube.distFromCam(currentAngle));
    }
    thisCube.draw(currentAngle);
  }
  
  
    
  currentAngle = (currentAngle + 0.1) % 360.0;
  //println(currentAngle);
}
