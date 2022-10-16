class GameOver {
  String gameOverText, resetbuttonText, pointsText;
  int resetbuttonX, resetbuttonY, resetbuttonA, resetbuttonB;//declares variables
  
  GameOver(int points) {
    this.gameOverText = "Game Over!";
    this.resetbuttonText = "Retry";
    this.pointsText = "Your final number of points is " + points;
    this.resetbuttonA = 220;
    this.resetbuttonB = 120;
    this.resetbuttonX = width/2 - this.resetbuttonA/2;
    this.resetbuttonY = height/2 - this.resetbuttonB/2;
  }
  
  void drawGameOver() {
    clear();
    coinList.clear();//clears coins from screen
    objectList.clear();//clears objects from screen
    
    //LAYOUT
    fill(255,50,50);//red background
    rect(0, 0, width, height);
    rect(resetbuttonX, resetbuttonY, resetbuttonA, resetbuttonB);

    //GAMEOVERTEXT
    stroke(100);//sets colour to draw borders around shapes 
    fill(255);
    textSize(80);
    text(this.gameOverText, width/2, height/4);

    //RESETBUTTON
    fill(0);
    stroke(100);
    rect(resetbuttonX, resetbuttonY, resetbuttonA, resetbuttonB);
    fill(255);
    text(resetbuttonText, resetbuttonX+110, resetbuttonY+50);
    
    //POINTS
    stroke(255);
    fill(255);
    textSize(40);
    text(pointsText, width/2, height - height/4);
  }

  boolean mouseOnresetButton() {
    //if mouse within boundaries of resetbutton.
        clear();
    return (mouseX > resetbuttonX //returns mouse pointers position(X axis),
      && mouseX < resetbuttonX + resetbuttonA
      && mouseY > resetbuttonY
      && mouseY < resetbuttonY + resetbuttonB);
  }
}
