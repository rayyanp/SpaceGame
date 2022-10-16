abstract class Object {
//abstract class to create functionality that subclasses can implement or override.

  int counter = 0;// constants
  int x;//declares variable 'x' of type int
  int y;
  
  Object(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  void update() {
    move();
    render();
  }

  void move() {
    x -= random(5);//generates random numbers up to 5. 
    y += random(3);//generates random numbers up to 3. 
  }
  
  // Implementation in child class
  abstract void render();

}
