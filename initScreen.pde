 void initScreen() //the first screen
  {
    drawBackground();
    player1.update();
     updateCoin();
     updateAsteroid();
     printScore();
     fill(255);
     fill(255);
     text(startTimer.getTime(),width/3.3,height/15.7);
     text("Timer:", width/5, height/15.7);
     textSize(width/30);
     
    textAlign(CENTER);
    textSize(width/10);
    text("FLYING SAUCERS", width/2, height/2.5);
    textSize(width/20);
    text("Collect all the coins within 60 seconds", width/2, height/2);
    textSize(width/20);
    text("Click to start", width/2, height/1.5);
   

  }
