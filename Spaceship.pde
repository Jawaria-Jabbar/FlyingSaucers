class Spaceship
{ 
 // members
int x,y;
int animationCounter=0; // animation counter
ArrayList <PImage>Images;//store all image files
int spaceShipWidth= width/13;
int spaceShipHeight= width/11;

//constructor 
Spaceship(int x, int y)
{
  PImage img;
  this.x =x;
  this.y=y;
  
  Images= new ArrayList<PImage>(); //allocates the memory
  
  for (int count=0; count<=24; count++)
  {
  img= loadImage("blue_ufo_gmc_" + count + ".png");
  img.resize(spaceShipWidth,spaceShipHeight);
  Images.add(img);
  }
  
 
}

void render() //draw
{ //choose next image to display
  
  int imageNumber = animationCounter/4;
  PImage currentImage= Images.get(imageNumber);
  animationCounter++;
  if (animationCounter>=100)
  { animationCounter = 0;}
  image(currentImage, this.x, this.y);
  
 
}
boolean crash(Coin coin) //distance crash method
{ 
    if (coin==null)
    return false;
    
    float xDist = coin.x - (this.x +(spaceShipWidth/3));
    float yDist = coin.y - (this.y +(spaceShipHeight/3));
    float dist = sqrt(xDist*xDist + yDist*yDist);
    return (dist<(spaceShipWidth/2));
}

boolean crash(Asteroid asteroid) //distance crash method
{ 
    if (asteroid==null)
    return false;
    
    float xDist = asteroid.x - (this.x +(spaceShipWidth/3));
    float yDist = asteroid.y - (this.y +(spaceShipHeight/3));
    float dist = sqrt(xDist*xDist + yDist*yDist);
    return (dist<(spaceShipWidth/2));
}


   void update()
  {
    render();
   
  }
}
