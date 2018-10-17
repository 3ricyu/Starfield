Particle[] aBunch;
void setup()
{
  size(600,600);
  aBunch = new Particle[500];
  for(int i = 0; i < aBunch.length; i++)
  {
    aBunch[i] = new NormalParticle();
    aBunch[0] = new JumboParticle();
    aBunch[1] = new OddballParticle();
    
  }
  //your code here
}
void draw()
{
  background(0);
  for(int i = 0; i < aBunch.length; i++)
  {
    aBunch[i].show();
    aBunch[i].move();
  }
  //your code here
}
void mousePressed()
{
   for(int i = 0; i < aBunch.length; i++)
  {
    aBunch[i] = new NormalParticle();
    aBunch[1] = new JumboParticle();
    aBunch[2] = new OddballParticle();
  }
  
}
class NormalParticle implements Particle
{
  double x,y,angle,speed;
  int pColor;
  
  NormalParticle()
  {
    x = 300;
    y = 300;
    angle = Math.random()*2*Math.PI;
    speed = Math.random()*7+0.5;
    pColor = color((int)(Math.random()),(int)(Math.random()),(int)(Math.random()));
    
  }
  public void move()
  {
    x = x + Math.cos(angle)*speed;
    y = y + Math.sin(angle)*speed;
    angle = angle + 0.01;
  }
  public void show()
  {
    fill((float)(Math.random()*256),(float)(Math.random()*256),(float)(Math.random()*256));
    ellipse((float)x,(float)y,5,5);
  }
  //your code here
}
interface Particle
{
  public void move();
  public void show();
  //your code here
}
class OddballParticle implements Particle //uses an interface
{
  double oddX,oddY,oddSpeed,oddAngle;
  int oddColor;
  OddballParticle()
  {
    oddX = 300;
    oddY = 300;
    oddAngle = Math.random()*2*Math.PI;
    oddSpeed = Math.random()*30+20;
    oddColor = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
    
  }
  public void move()
  {
    oddX = oddX + Math.cos(oddAngle)*oddSpeed;
    oddY = oddY + Math.sin(oddAngle)*oddSpeed;
    oddAngle = oddAngle + oddSpeed;
    if (oddX > 600) oddX = 0;
    if(oddX < 0) oddX = 600;
    if (oddY > 600) oddY = 0;
    if (oddY < 0) oddY = 600;
  }
  public void show()
  {
    fill(oddColor);
    rect((float)oddX,(float)oddY,30,30);
  }
  //your code here
}
class JumboParticle extends NormalParticle //uses inheritance
{
  public void show()
  {
    fill((float)(Math.random()*256),(float)(Math.random()*256),(float)(Math.random()*256));
    ellipse((float)x,(float)y,50,50);
  }
  //your code here
}
