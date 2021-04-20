class Coin
//member
{
  int x=0;
  int y=0;
  int animationCounter=0; // animation counter
  ArrayList <PImage>Images;//store all image files
  int CoinSize= width/30;
  
  //constructor
 Coin(int x, int y)
  {
    PImage img;
    this.x=x;
    this.y=y;
    Images= new ArrayList<PImage>(); //allocates the memory
  
  for (int count=1; count<=8; count++)
  {
  img= loadImage("coin_0" + count + ".png");
  img.resize(CoinSize,CoinSize);
  Images.add(img);
  }
  
  }
  
 void render()
 {
   int imageNumber = animationCounter/10;
  PImage currentImage= Images.get(imageNumber);
  animationCounter++;
  if (animationCounter>=80)
  { animationCounter = 0;}
  image(currentImage, this.x, this.y);
  
   
}
 }
