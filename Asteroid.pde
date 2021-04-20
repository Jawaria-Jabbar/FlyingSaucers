class Asteroid
//member
{
  int x=0;
  int y=0;
  int animationCounter=0; // animation counter
  PImage img1;
  ArrayList <PImage>Images;//store all image files
  int asteroidSize= width/15;
  
  //constructor
 Asteroid(int x, int y)
  {
    PImage img;
    this.x=x;
    this.y=y;
    Images= new ArrayList<PImage>(); //allocates the memory
  
  for (int count=0; count<=1; count++)
  {
  img= loadImage("asteroid_" + count + ".png");
  img.resize(asteroidSize,asteroidSize);
  Images.add(img);
  }
  
  }
  
 void render()
 {
   int imageNumber = animationCounter/30;
  PImage currentImage= Images.get(imageNumber);
  animationCounter++;
  if (animationCounter>=60) //if the animation counter goes oto 60 or over, then back to the first image
  { animationCounter = 0;}
  image(currentImage, this.x, this.y);
  
   
}
 }
