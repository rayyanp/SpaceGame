class Enemy extends Object{
//inherits Object class

  final PImage img1 = loadImage("enemy1.png");//stored object image to display
  final PImage img2 = loadImage("enemy2.png");
  final PImage img3 = loadImage("enemy3.png");
  final PImage img4 = loadImage("enemy4.png");
  final PImage img5 = loadImage("enemy5.png");
  final PImage img6 = loadImage("enemy6.png");
  
  Enemy(int x, int y){
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
    } else if (counter < 40) { 
      image(img4, x, y, 30, 30); // 30 - 39 (10)
    } else if (counter < 50) { 
      image(img5, x, y, 30, 30); // 40 - 49 (10)
    } else if (counter < 59) { 
      image(img6, x, y, 30, 30); // 50 - 58 (9)
    } else { 
      image(img6, x, y, 30, 30);//(image,x location, y location, size, size)
      counter=0;
    }
    counter++;//Increases the value of counter variable by 1. 
  }
  
}
  
