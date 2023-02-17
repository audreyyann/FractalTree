private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .5;  
public void setup() 
{   
  size(640,480);    
  noLoop(); 
} 
public void draw() 
{   
  background(193, 214, 224);   
  stroke(168, 143, 141); 
  strokeWeight(10);
  line(320,480,320,380);
  drawBranches(320, 380, 100, 3*Math.PI/2);  //will add later 
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
  int endX1;
  int endY1;
  int endX2;
  int endY2;
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  branchLength = branchLength*fractionLength;
  endX1 = (int)(branchLength*Math.cos(angle1) + x);
  endY1 = (int)(branchLength*Math.sin(angle1) + y);
  endX2 = (int)(branchLength*Math.cos(angle2) + x);
  endY2 = (int)(branchLength*Math.sin(angle2) + y);
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);
  if(branchLength > smallestBranch){
    strokeWeight(5);
    stroke(204, 224, 193);
    drawBranches(endX1, endY1, branchLength - fractionLength, angle1);
    drawBranches(endX2, endY2, branchLength - fractionLength, angle2);
    stroke(159, 176, 150);
    drawBranches(endX1, endY1, branchLength - fractionLength, angle1-0.07);
    drawBranches(endX2, endY2, branchLength - fractionLength, angle2);
  }
} 
