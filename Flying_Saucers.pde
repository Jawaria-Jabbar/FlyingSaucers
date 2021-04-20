
int coinNumber=5;
int asteroidNumber=5;

PImage background;

int x=0;
int gameScreen=0;
int shipSpeed=width/5;
int score =0;
int spaceShipWidth= width/13;
int spaceShipHeight= width/11;


Spaceship player1;
Timer startTimer;



//Coin coin;
ArrayList<Coin> coins = new ArrayList<Coin> ();
// Asteroid asteroid;
ArrayList<Asteroid> asteroids = new ArrayList<Asteroid> ();

void createCoin()
{
  //coin = new Coin();
  for(int count=0; count<coinNumber; count++)
  {
    coins.add(new Coin((int)random(0) + (int)random(width-100), (int)random(height-100) + (int)random(0)) );
  }
}

void resetCoin() // clear coins and add more
{
  coins.clear();
  createCoin();
}


void createAsteroid()
{
  //asteroid = new Asteroid();
  for(int count=0; count<asteroidNumber; count++)
  {
   
    asteroids.add(new Asteroid ((int)random(0) + (int)random(width-100), (int)random(height-100) + (int)random(0)));
  }
}

void resetAsteroid() // reset asteriods back to a random x-y value
{
  asteroids.clear();
  createAsteroid();
}


void setup()
{
  size(1200,700);
  background = loadImage ("SKY1.png");
  background.resize(width,height);
  player1= new Spaceship(10,10);
  createCoin();
  createAsteroid();
  startTimer = new Timer(60);
  
  
}

void updateCoin() //draw coins
{
  for(Coin coin: coins)
  {
    coin.render();
  }
}

void updateAsteroid() //draw asteroids
{
  for(Asteroid asteroid: asteroids)
  {
    asteroid.render();
  }
}


void draw () {//runs 60 times per second 
// display contents of current screen

 if (gameScreen == 0) {
   initScreen();
 }
 
 
    else if(gameScreen == 1) {
      playScreen();
    }
    else if (gameScreen == 2) {
      gameWinScreen();
    }
       else if (gameScreen == 3) {
      timeOverScreen();
    } 
   
    else if (gameScreen == 4) {
      hitOverScreen();
    } 
    

   }
   
  void score() {
    score++; // add 1 to the score
  }
  
  void printScore(){
   
  textAlign(CENTER);
  fill(255);
  textSize(width/30);
  text("Score:", width/19, height/15.7);
  textSize(width/30); 
  text(score, width/9,height/15.7);
}
  
  void mousePressed() {
    if (gameScreen ==0) {// if on int screen, when clicked start the game
        startGame(); }
      
      else if (gameScreen ==2) { // if on gameWin screen, go back to int screen game            
               nextLevel();
               }
      else if (gameScreen ==3) { // if on timeOver screen, go back to int screen game         
               restart();
             }
       else if (gameScreen ==4) { // if on hitOver screen, go back to int screen game         
               restart();
             }
  }
  
  void startGame() { //sets variable to start the game
    gameScreen=1;
    
  }
  
  void nextLevel() { //sets variable to restart the game
 
  player1= new Spaceship(10,10);
   asteroidNumber++;
   coinNumber=coinNumber*2;
   drawBackground();
   resetAsteroid();
   updateCoin();
   createCoin();
   startTimer = new Timer(60);
   score=0;
   gameScreen=1;
    
  }
  void restart() { //sets variable to restart the game
   
 
   startTimer = new Timer(60);
   score=0;
   player1= new Spaceship(10,10);
   resetCoin();
   resetAsteroid();
   gameScreen=1;


   

  }
  
 
 

   



void drawBackground()
{
  image(background, x, 0); //draw background 
}





void keyPressed() //player 1 movement
{
  if (key==CODED)
    {
      if (keyCode==UP && player1.y >= height-height)
      {player1.y=player1.y-shipSpeed; } //player UP //5=speed
    
     
   
    if(keyCode==DOWN && player1.y + spaceShipHeight*11 <= height)
    {player1.y=player1.y+shipSpeed;}// player down 
      
    
    
      if(keyCode==RIGHT && player1.x+spaceShipWidth*13 <= width)
      {player1.x=player1.x+shipSpeed;} // player right
    
    
     if(keyCode==LEFT && player1.x >= width-width)
      {player1.x=player1.x-shipSpeed;} // player left
    }
    
   
  }
  
