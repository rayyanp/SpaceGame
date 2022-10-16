class Coin {

  int x;//Declares variable 'x' of type int
  int y;//Declares variable 'y' of type int
  int counter = 0; // int: 0, float/double 0.0 , booleans:false

  final PImage img1 = loadImage("coin1.png");//stored object image to display
  final PImage img2 = loadImage("coin2.png");
  final PImage img3 = loadImage("coin3.png");
  final PImage img4 = loadImage("coin4.png");
  final PImage img5 = loadImage("coin5.png");
  final PImage img6 = loadImage("coin6.png");

  Coin(int x, int y) { // signature: int, int
    this.x = x;
    this.y = y;
  }

  void update() {
    render();
  }

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
