class Nightraider {
  
final PImage IMG = loadImage("attacker.png");//stored object image to display

//PVector stores x and y components, primiative variable.
  PVector position;
  PVector acceleration;
  PVector velocity;

  Nightraider() {
    
    position = new PVector(10, 300);
    acceleration = new PVector(0,0);
    velocity = new PVector(0,0);
  }
  
  void Display() {
    image(IMG, position.x,position.y , 80, 80);
  }
  
  void Update() {
    PVector Spaceship = new PVector(player.x,player.y);
    PVector direction = PVector.sub(Spaceship,position);//direction= position of spaceship-position
    
    direction.normalize();//vector normal if length is 1. Normalize vector to change it so points are in same direction. Unit vector
    acceleration = direction;
    velocity.add(acceleration);//adds the two vectors
    velocity.limit(0.75);//Limits the magnitude of vector to the parameter value
    position.add(velocity);//adds the two vectors
  }
      boolean crash(Spaceship player) {
    return abs(position.x-player.x) < 40 && abs(position.y - player.y) < 20;//calculates absolute value/magnitude.
}
}
