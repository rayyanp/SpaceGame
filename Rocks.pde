class Rock extends Object{
//inherits Object class

  final PImage img1 = loadImage("rock1.png");//stored object image to display
  final PImage img2 = loadImage("rock2.png");
  final PImage img3 = loadImage("rock3.png");
  final PImage img4 = loadImage("rock4.png");

  Rock(int x, int y) { // signature: int, int
    super(x,y);//a call to the constructor of the parent class
  }

  @Override//overriding render method from parent class
  void render() {
    if (counter < 10) { 
      image(img1, x, y, 30, 30); // 0-9 (10)
    } else if (counter < 20) { 
      image(img2, x, y, 30, 30); // 10 - 19 (10)
    } else if (counter < 30) { 
      image(img3, x, y, 30, 30); // 20 - 29 (10)
    } else if (counter < 39) { 
      image(img4, x, y, 30, 30); // 30 - 38 (9)
    } else { 
      image(img4, x, y, 30, 30);//(image,x location, y location, size, size)
      counter=0;
    }
    counter++;//Increases the value of counter variable by 1. 
  }
}
