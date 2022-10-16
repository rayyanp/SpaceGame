Spaceship player;//reference which can point to a Spacehsip object
Nightraider nightraider;//reference which can point to a Nightraider object
PFont font;//font for text used
String time = "60";//time limit for game
int t;//declares variable 't' of type int
int interval = 60;//time limit for game
int startTime;
final int startDelayTime = 5000;//for countdown(5 seconds)
boolean StartUp = true;
PImage backGround;//stored background image to display
PImage startBackground;//stored background image to display for startscreen
int backgroundX = 0;
String gameState;//stores a single string
int spawnTimer = 0;
int x = 0;//declares variable x
int points; //integer, number of points
ArrayList<Object> objectList = new ArrayList();//stores variable number of rocks and enemies(Objects)
ArrayList<Coin> coinList = new ArrayList();//stores variable number of coins


GameOver over;

void setup() {//runs only once
  font = createFont("Arial", 30);//creates font for all text in game.
  fill(0); // change fill to black
  size(1200, 800); // width, height
  gameState = "START";
  backGround = loadImage("backgroundSpace.png");//Loads an image into a variable of type PImage, png image loaded.
  backGround.resize(width, height);//Resizes the image to the width and height. To make the image scale proportionally, use 0 as the value for the wide or high parameter. 
  startBackground = loadImage("Startscreen.png");//Loads an image into a variable of type PImage, png image loaded.
  startBackground.resize(width, height);//Resizes the image to the width and height. To make the image scale proportionally, use 0 as the value for the wide or high parameter. 
  player = new Spaceship(100,height/2);
  nightraider = new Nightraider(); 
  points = 0;

  // loop 8 times, 8 iterations, initialize each index value.
  for (int i = 0; i < 8; i++) {
    objectList.add( new Rock( width+(int) random(150) , height+(int) random(380) )  );
  }
  for (int f = 0; f < 8; f++) {
    coinList.add( new Coin( width+(int) random(150) , height+(int) random(380) )  );
  }
  for (int e = 0; e < 8; e++) {
    objectList.add( new Enemy( width+(int) random(150) ,height+ (int) random(380) )  );
  }
}

void draw() {// 60 times a second
  
  if (gameState == "START"){
    startGame();
  }else if (gameState == "PLAY"){
    playGame();
  }
}

void startGame(){
  background(0);//background black
  image(startBackground,0,0);//startscreen image background
  //TITLE
  textAlign(CENTER);//aligns text centerally
  textSize(100);
  fill(255,255,255);//text in white
  text("SPACE ESCAPE", 600, 100);
  
  //BRIEF
  textAlign(LEFT);//aligns text to the left
  textSize(40);
  fill(255,255,255);
  text("BRIEF:", 20, 180);
  textAlign(LEFT);
  textSize(20);
  fill(255,255,255);
  text("The aim of the game is to evade the attacker, that follows you,", 20, 220);
  text("avoid rocks and enemies, as well as collecting coins along the way.", 20, 250);
  text("The more coins you collect, the more points you gain.", 20, 280);
  
  //CREDITS
  textAlign(LEFT);
  textSize(40);
  fill(255,255,255);
  text("CREDITS:", 800, 180);
  textSize(20);
  fill(255,255,255);
  text("Satur9-Background", 800, 220);
  text("www.LifeStampGames.com-spaceship", 800, 250);
  text("dravenX-NightRaider spaceship", 800, 280);
  text("Carlos Alface-Enemies", 800, 310);
  text("AustinJeong - Coins", 800, 340);
  text("Écrivain - Rocks", 800, 370);
  text("Scribe - Background", 800, 400);
  text("Images sourced from opengameart.org", 800, 430);
  textAlign(CENTER);//aligns text centerally
  text("Game created by Rayyan Patel", width/2, 700);
  textSize(50);
  fill(255,255,255);
  text("Click anywhere to play!", width/2, 500 );
  
  if (mousePressed==true){
    gameState = "PLAY";//If the mouse is pressed then it will start the game.
    startTime = millis();//starts time in milliseconds
  }
}

int currentTime;
void playGame(){
  // If we're in the startup, a countdown will be shown.
  if (StartUp) {
    currentTime = millis();// The current time, is in milliseconds
    int startupTimeRemaining = startDelayTime - (currentTime - startTime);// The remaining time in the startup period
    startScreen(startupTimeRemaining);//countdown
    StartUp = startupTimeRemaining > 0;
    // Short circuit if we're still in the startup phase.
    return;
  }
  
  spawnTimer++; // adds 1 to spawnTimer
  
  if (spawnTimer % 60 ==0) { // every 1 second
  objectList.add( new Rock( width+(int) random(1000) , (int) random(700) )  );
  }
  if (spawnTimer % 60 ==0) { // every 1 second
  coinList.add( new Coin( (int) random(1000) , (int) random(700) )  );
  }
  if (spawnTimer % 60 ==0) { // every 1 second
  objectList.add( new Enemy( width+(int) random(1000) , (int) random(700) )  );
  }
  //if the game is over then show gameover screen, else draw and start game.
  if (over != null) {
    over.drawGameOver();
  } else { 
    background(0);
    //calls functions
    drawBackground();//calls drawbackground function
    player.render();
    nightraider.Display();
    nightraider.Update();
    
    fill(255);
    stroke(255);
    fill(255);
    textSize(30);
    text("Points: " + points,  100, 50);//To display points on the screen.
  
    int diff = millis()/1000 - currentTime/1000;
    t = interval-diff; //<>// //<>// //<>//
    time = nf(t , 3);//formats number without rounding.
    if(t == 0){//if the time reaches 0, the game over screen will show.
    over = new GameOver(points);
    interval+=10;}
    text("Time:"+ time, 1100, 50);//To display time on the screen.
     
    for(int i = 0; i < objectList.size(); i++) {//for loop to quickly initialise each arrays index.
      Object currentObject = objectList.get(i);
      
      currentObject.update(); //calls object update to allow move and render function
      if (player.crash( currentObject )  ) {//if player crashes into the current object
        objectList.remove( i );//removes object
        over = new GameOver(points);//gameover screen shown with points attained displayed.
      } 
    }
  } 
  
  for(int f = 0; f < coinList.size(); f++) {//for loop to quickly initialise each arrays index.
    Coin currentCoin = coinList.get(f); 
    
    currentCoin.render();//calls coin render function
    if (player.crash( currentCoin ) || (currentCoin.x <-100 || currentCoin.y <-100)) {
      coinList.remove( f );//if player crashes into the current object remove current coin.
      points++;//+1 point
    } 
  }
  
  if (nightraider.crash(player))//if the attacker collides with the spaceship
  over = new GameOver(points);//then the end scene (game over screen) shows.
}
    
void startScreen(int remainingTime){//draws startscreen with countdown timer
  background(0);
  image(startBackground,0,0);
  textSize(50);
  fill(255,255,255);
  textAlign(CENTER,CENTER); 
  text("Welcome to Space Escape!",600,200);
  text("Your mission will start in",600,300);
  textSize(100);
  fill(255,255,255);
  textAlign(CENTER,CENTER); 
  text(ceil(remainingTime/1000.0), 1200/2, 1000/2);//ceil calculates the closest integer value that is greater than or equal to the value of the parameter. 
}

void drawBackground() {
  image(backGround, backgroundX, 0); //draw background twice
  image(backGround, backgroundX+backGround.width, 0);
  backgroundX -=3; //move background 3 pixels to left
  if (backgroundX == -backGround.width) 
    backgroundX=0; //wrap background
}

void keyPressed() {//runs on a keypressed event/
  if (key == CODED) {//conditional
    if (keyCode == UP && player.y > 0){//The variable keyCode is used to detect special keys such as the arrow keys (UP, DOWN, LEFT, and RIGHT) as well as ALT, CONTROL, and SHIFT. 
    player.y -= 12;//player moves up if up arrow key is pressed.
    }
    else if (keyCode == DOWN && player.y < height-140){
    player.y += 12;//players move down if down arrow key is pressed.
  }
      if (keyCode == RIGHT && player.x < width-150){
      player.x += 12;//player moves right if right arrow key is pressed.
      player.left=true;//right image shown
    }
      else if (keyCode == LEFT && player.x > 10){
      player.x -= 12;//player moves left if left arrow key is pressed.
      player.left=false;//left image shown
    }
  }
}

void mousePressed() {//runs when mouse is pressed
  if (over != null && over.mouseOnresetButton() == true) {//if the game is over and the mouse clicks on the reset button.
    resetGame();//the game will reset.
  }
}

void resetGame() {//resets game after gameover screen
objectList.clear();//clears objects from screen
coinList.clear();//clears coins from screen
player = new Spaceship(100,height/2);//reset spaceship location.
nightraider = new Nightraider();//reset nightraider location.
over = null;//The target(over) is not a valid data element.
points = 0;//resets points to 0
currentTime = millis(); //Used for timer
}
  
