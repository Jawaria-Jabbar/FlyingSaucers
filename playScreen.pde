void playScreen() //the playing screen
  {
  
     drawBackground();    
     player1.update();
     updateCoin();
     updateAsteroid();
     printScore();
     fill(255);
     startTimer.countDown();
     fill(255);
     text(startTimer.getTime(),width/3.3,height/15.7);
     text("Timer:", width/5, height/15.7);
     textSize(width/30);
    
     

    Coin hitCoin = null; // reference to point at an instant within the list
      for(Coin coin: coins) //remove coin using Array
      {
        if (player1.crash(coin))
          { 
         
            //coins.remove(hitCoin);
            hitCoin = coin;
          }
      }
        //can remove coin from outside the loop
      if (hitCoin!=null) // was an instance detected
      coins.remove(hitCoin);
      
      if (hitCoin!=null)
      score();
      
      if (score >= coinNumber) //if all coins collected, game ends and you win
      gameScreen=2;
      
      if (startTimer.getTime() <= 0 && score <coinNumber)
      gameScreen=3;
      
      //Asteroid collison - game over
       Asteroid hitAsteroid = null; 
      for(Asteroid asteroid: asteroids) 
      {
        if (player1.crash(asteroid))
          { 
            explosion= new Explosion(width,height);
            gameScreen=4;
            hitAsteroid = asteroid;
          }
      }
      
      
      
  }
