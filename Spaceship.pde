class Spaceship{
  
  boolean left=true;//boolean condition true or false.
  int x; //declares variable 'x' of type int
  int y;
  final PImage IMG = loadImage("spaceship.png");//stored spaceship image to display
  final PImage IMG2 = loadImage("spaceshipleft.png");//stored spaceship left image to display

  // constructor - responsible building an object of this class  
  Spaceship(int x, int y) {
    this.y = y;
    this.x = x;
  }
  
  void render() {
    if(left==true){//code runs if left=true
    image(IMG, x, y, 125, 125);
  }
      else{//code runs if left=false
    image(IMG2, x, y, 125, 125);
  }
}
  
  boolean crash(Object inanimateobject) {
    if (inanimateobject==null)//if object is not a valid data element.
      return false;
      
      float xDist = inanimateobject.x - (this.x+52);
      float yDist = inanimateobject.y - (this.y+52);
      float dist = sqrt(xDist*xDist +yDist*yDist);//pythagoras
      return(dist<45);//distance less than 45
    }
    
    boolean crash(Coin coin) {
      if (coin==null)//if coin is not a valid data element.
      return false;
      
      float xDist = coin.x - (this.x+52);
      float yDist = coin.y - (this.y+52);
      float dist = sqrt(xDist*xDist +yDist*yDist);//pythagoras
      return(dist<65);//distance less than 65
    }
  }


  
     
